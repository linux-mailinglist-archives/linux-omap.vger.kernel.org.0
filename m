Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94ABF2EBE18
	for <lists+linux-omap@lfdr.de>; Wed,  6 Jan 2021 13:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbhAFM7N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 07:59:13 -0500
Received: from muru.com ([72.249.23.125]:40986 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726791AbhAFM7N (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Jan 2021 07:59:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1F80A80AF;
        Wed,  6 Jan 2021 12:58:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: [PATCHv4 0/4] Lost key-up interrupt handling for omap4-keypad
Date:   Wed,  6 Jan 2021 14:58:18 +0200
Message-Id: <20210106125822.31315-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series updates omap4-keypad to disable unused long interrupts, and
implements the missing parts for the lost key-up interrupt quirk as
described in the silicon errata pdf. It also simplifies the probe to
use devm.

Regards,

Tony


Changes since v3:

- Use PM runtime to check the last pressed key is not stuck

- Simplify probe with devm

Changes since v2:

- Drop bogus level change, that already comes from device tree

- Scan keyboard in two phases and simplify using a bitmask

- Use mod_delayed_work and cancel_delayed_work_sync for the quirk

Tony Lindgren (4):
  Input: omap4-keypad - disable unused long interrupts
  Input: omap4-keypad - scan keys in two phases and simplify with
    bitmask
  Input: omap4-keypad - use PM runtime to check keys for errata
  Input: omap4-keypad - simplify probe with devm

 drivers/input/keyboard/omap4-keypad.c | 255 +++++++++++++++++---------
 1 file changed, 170 insertions(+), 85 deletions(-)

-- 
2.30.0
