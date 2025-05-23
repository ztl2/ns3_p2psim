/*
 * Copyright (c) 2012 University of Washington
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *
 */

/*
 * This example is designed to show the main features of an
 * ns3::DoubleProbe.
 */

#include "ns3/core-module.h"
#include "ns3/double-probe.h"

#include <string>

using namespace ns3;

NS_LOG_COMPONENT_DEFINE("DoubleProbeExample");

/**
 * This is our test object, an object that increments counters at
 * various times and emits one of them as a trace source.
 */
class Emitter : public Object
{
  public:
    /**
     * Register this type.
     * @return The TypeId.
     */
    static TypeId GetTypeId();
    Emitter();

  private:
    void DoInitialize() override;

    /// Generate data - actually this function is not traced.
    void Emit();
    /// Counts how many times this function is called.
    void Count();

    TracedValue<double> m_counter;        //!< Sample counter, normally this would be integer type
    Ptr<ExponentialRandomVariable> m_var; //!< Random number generator
};

NS_OBJECT_ENSURE_REGISTERED(Emitter);

TypeId
Emitter::GetTypeId()
{
    static TypeId tid = TypeId("ns3::Emitter")
                            .SetParent<Object>()
                            .SetGroupName("Stats")
                            .AddConstructor<Emitter>()
                            .AddTraceSource("Counter",
                                            "sample counter",
                                            MakeTraceSourceAccessor(&Emitter::m_counter),
                                            "ns3::TracedValueCallback::Double");
    return tid;
}

Emitter::Emitter()
{
    NS_LOG_FUNCTION(this);
    m_counter = 0;
    m_var = CreateObject<ExponentialRandomVariable>();
}

void
Emitter::DoInitialize()
{
    NS_LOG_FUNCTION(this);
    Simulator::Schedule(Seconds(m_var->GetValue()), &Emitter::Emit, this);
    Simulator::Schedule(Seconds(m_var->GetValue()), &Emitter::Count, this);
}

void
Emitter::Emit()
{
    NS_LOG_FUNCTION(this);
    NS_LOG_DEBUG("Emitting at " << Simulator::Now().As(Time::S));
    Simulator::Schedule(Seconds(m_var->GetValue()), &Emitter::Emit, this);
}

void
Emitter::Count()
{
    NS_LOG_FUNCTION(this);
    NS_LOG_DEBUG("Counting at " << Simulator::Now().As(Time::S));
    m_counter += 1.0;
    DoubleProbe::SetValueByPath("/Names/StaticallyAccessedProbe", m_counter);
    Simulator::Schedule(Seconds(m_var->GetValue()), &Emitter::Count, this);
}

/**
 * This is a function to test hooking a raw function to the trace source,
 *
 * @param context The trace context.
 * @param oldVal Old value.
 * @param newVal New value.
 */
void
NotifyViaTraceSource(std::string context, double oldVal, double newVal)
{
    NS_LOG_DEBUG("context: " << context << " old " << oldVal << " new " << newVal);
}

/**
 * This is a function to test hooking it to the probe output
 *
 * @param context The trace context.
 * @param oldVal Old value.
 * @param newVal New value.
 */
void
NotifyViaProbe(std::string context, double oldVal, double newVal)
{
    NS_LOG_DEBUG("context: " << context << " old " << oldVal << " new " << newVal);
}

int
main(int argc, char* argv[])
{
    CommandLine cmd(__FILE__);
    cmd.Parse(argc, argv);
    bool connected;

    Ptr<Emitter> emitter = CreateObject<Emitter>();
    Names::Add("/Names/Emitter", emitter);

    //
    // The below shows typical functionality without a probe
    // (connect a sink function to a trace source)
    //
    connected =
        emitter->TraceConnect("Counter", "sample context", MakeCallback(&NotifyViaTraceSource));
    NS_ASSERT_MSG(connected, "Trace source not connected");

    //
    // Next, we'll show several use cases of using a Probe to access and
    // filter the values of the underlying trace source
    //

    //
    // Probe1 will be hooked directly to the Emitter trace source object
    //

    // probe1 will be hooked to the Emitter trace source
    Ptr<DoubleProbe> probe1 = CreateObject<DoubleProbe>();
    // the probe's name can serve as its context in the tracing
    probe1->SetName("ObjectProbe");

    // Connect the probe to the emitter's Counter
    connected = probe1->ConnectByObject("Counter", emitter);
    NS_ASSERT_MSG(connected, "Trace source not connected to probe1");

    // The probe itself should generate output.  The context that we provide
    // to this probe (in this case, the probe name) will help to disambiguate
    // the source of the trace
    connected = probe1->TraceConnect("Output", probe1->GetName(), MakeCallback(&NotifyViaProbe));
    NS_ASSERT_MSG(connected, "Trace source not connected to probe1 Output");

    //
    // Probe2 will be hooked to the Emitter trace source object by
    // accessing it by path name in the Config database
    //

    // Create another similar probe; this will hook up via a Config path
    Ptr<DoubleProbe> probe2 = CreateObject<DoubleProbe>();
    probe2->SetName("PathProbe");

    // Note, no return value is checked here
    probe2->ConnectByPath("/Names/Emitter/Counter");

    // The probe itself should generate output.  The context that we provide
    // to this probe (in this case, the probe name) will help to disambiguate
    // the source of the trace
    connected = probe2->TraceConnect("Output",
                                     "/Names/Probes/PathProbe/Output",
                                     MakeCallback(&NotifyViaProbe));
    NS_ASSERT_MSG(connected, "Trace source not connected to probe2 Output");

    //
    // Probe3 will be called by the emitter directly through the
    // static method SetValueByPath().
    //
    Ptr<DoubleProbe> probe3 = CreateObject<DoubleProbe>();
    probe3->SetName("StaticallyAccessedProbe");
    // We must add it to the config database
    Names::Add("/Names/Probes", probe3->GetName(), probe3);

    // The probe itself should generate output.  The context that we provide
    // to this probe (in this case, the probe name) will help to disambiguate
    // the source of the trace
    connected = probe3->TraceConnect("Output",
                                     "/Names/Probes/StaticallyAccessedProbe/Output",
                                     MakeCallback(&NotifyViaProbe));
    NS_ASSERT_MSG(connected, "Trace source not connected to probe3 Output");

    // The Emitter object is not associated with an ns-3 node, so
    // it won't get started automatically, so we need to do this ourselves
    Simulator::Schedule(Seconds(0), &Emitter::Initialize, emitter);

    Simulator::Stop(Seconds(100));
    Simulator::Run();
    Simulator::Destroy();

    return 0;
}
