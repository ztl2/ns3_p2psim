/*
 * Copyright (c) 2010 CTTC
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *
 * Author: Nicola Baldo <nbaldo@cttc.es>
 */

#ifndef WAVEFORM_GENERATOR_HELPER_H
#define WAVEFORM_GENERATOR_HELPER_H

#include "ns3/attribute.h"
#include "ns3/net-device-container.h"
#include "ns3/node-container.h"
#include "ns3/object-factory.h"
#include "ns3/queue.h"

#include <string>

namespace ns3
{

class SpectrumValue;
class SpectrumChannel;

/**
 * @ingroup spectrum
 *
 * Create a Waveform generator, which can be used to inject specific noise in the channel.
 */
class WaveformGeneratorHelper
{
  public:
    WaveformGeneratorHelper();
    ~WaveformGeneratorHelper();

    /**
     * set the SpectrumChannel that will be used by SpectrumPhy instances created by this helper
     *
     * @param channel
     */
    void SetChannel(Ptr<SpectrumChannel> channel);

    /**
     * set the SpectrumChannel that will be used by SpectrumPhy instances created by this helper
     *
     * @param channelName
     */
    void SetChannel(std::string channelName);

    /**
     *
     * @param txPsd the Power Spectral Density to be used for transmission by all created PHY
     * instances
     */
    void SetTxPowerSpectralDensity(Ptr<SpectrumValue> txPsd);

    /**
     * @param name the name of the attribute to set
     * @param v the value of the attribute
     *
     * Set these attributes on each HdOfdmSpectrumPhy instance to be created
     */
    void SetPhyAttribute(std::string name, const AttributeValue& v);

    /**
     * @param n1 the name of the attribute to set
     * @param v1 the value of the attribute to set
     *
     * Set these attributes on each AlohaNoackNetDevice created
     */
    void SetDeviceAttribute(std::string n1, const AttributeValue& v1);

    /**
     * @tparam Ts \deduced Argument types
     * @param type the type of the model to set
     * @param [in] args Name and AttributeValue pairs to set.
     *
     * Configure the AntennaModel instance for each new device to be created
     */
    template <typename... Ts>
    void SetAntenna(std::string type, Ts&&... args);

    /**
     * @param c the set of nodes on which a device must be created
     * @return a device container which contains all the devices created by this method.
     */
    NetDeviceContainer Install(NodeContainer c) const;
    /**
     * @param node the node on which a device must be created
     * @returns a device container which contains all the devices created by this method.
     */
    NetDeviceContainer Install(Ptr<Node> node) const;
    /**
     * @param nodeName the name of node on which a device must be created
     * @return a device container which contains all the devices created by this method.
     */
    NetDeviceContainer Install(std::string nodeName) const;

  protected:
    ObjectFactory m_phy;            //!< Object factory for the phy objects
    ObjectFactory m_device;         //!< Object factory for the NetDevice objects
    ObjectFactory m_antenna;        //!< Object factory for the Antenna objects
    Ptr<SpectrumChannel> m_channel; //!< Channel
    Ptr<SpectrumValue> m_txPsd;     //!< Tx power spectral density
};

/***************************************************************
 *  Implementation of the templates declared above.
 ***************************************************************/

template <typename... Ts>
void
WaveformGeneratorHelper::SetAntenna(std::string type, Ts&&... args)
{
    m_antenna = ObjectFactory(type, std::forward<Ts>(args)...);
}

} // namespace ns3

#endif /* WAVEFORM_GENERATOR_HELPER_H */
