/*
 * Copyright (c) 2019 Universita' degli Studi di Napoli Federico II
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *
 * Author: Stefano Avallone <stavallo@unina.it>
 */

#ifndef BLOCK_ACK_WINDOW_H
#define BLOCK_ACK_WINDOW_H

#include <cstdint>
#include <vector>

namespace ns3
{

/**
 * @ingroup wifi
 * @brief Block ack window
 *
 * This class provides the basic functionalities of a window sliding over a
 * bitmap: accessing any element in the bitmap and moving the window forward
 * a given number of positions. This class can be used to implement both
 * an originator's window and a recipient's window.
 *
 * The window is implemented as a vector of bool and managed as a circular
 * queue. The window is moved forward by advancing the head of the queue and
 * clearing the elements that become part of the tail of the queue. Hence,
 * no element is required to be shifted when the window moves forward.
 *
 * Example:
 *
 * |0|1|1|0|1|1|1|0|1|1|1|1|1|1|1|0|
 *                      ^
 *                      |
 *                     HEAD
 *
 * After moving the window forward three positions:
 *
 * |0|1|1|0|1|1|1|0|1|1|0|0|0|1|1|0|
 *                            ^
 *                            |
 *                           HEAD
 */
class BlockAckWindow
{
  public:
    /**
     * Constructor
     */
    BlockAckWindow();
    /**
     * Initialize the window with the given starting sequence number and size
     *
     * @param winStart the window start
     * @param winSize the window size
     */
    void Init(uint16_t winStart, uint16_t winSize);
    /**
     * Reset the window by clearing all the elements and setting winStart to the
     * given value.
     *
     * @param winStart the window start
     */
    void Reset(uint16_t winStart);
    /**
     * Get the current winStart value.
     *
     * @return the current winStart value
     */
    uint16_t GetWinStart() const;
    /**
     * Get the current winEnd value.
     *
     * @return the current winEnd value
     */
    uint16_t GetWinEnd() const;
    /**
     * Get the window size.
     *
     * @return the window size
     */
    std::size_t GetWinSize() const;
    /**
     * Get a reference to the element in the window having the given distance from
     * the current winStart. Note that the given distance must be less than the
     * window size.
     *
     * @param distance the given distance
     * @return a reference to the element in the window having the given distance
     *         from the current winStart
     */
    std::vector<bool>::reference At(std::size_t distance);
    /**
     * Get a const reference to the element in the window having the given distance from
     * the current winStart. Note that the given distance must be less than the
     * window size.
     *
     * @param distance the given distance
     * @return a const reference to the element in the window having the given distance
     *         from the current winStart
     */
    std::vector<bool>::const_reference At(std::size_t distance) const;
    /**
     * Advance the current winStart by the given number of positions.
     *
     * @param count the number of positions the current winStart must be advanced by
     */
    void Advance(std::size_t count);

  private:
    uint16_t m_winStart;        ///< window start (sequence number)
    std::vector<bool> m_window; ///< window
    std::size_t m_head;         ///< index of winStart in the vector
};

} // namespace ns3

#endif /* BLOCK_ACK_WINDOW_H */
