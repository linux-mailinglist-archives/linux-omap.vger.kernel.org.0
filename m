Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FFA2F0934
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 20:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbhAJTGV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 14:06:21 -0500
Received: from muru.com ([72.249.23.125]:42244 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbhAJTGV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 Jan 2021 14:06:21 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7FF4280E4;
        Sun, 10 Jan 2021 19:05:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: [PATCHv5 0/5] Lost key-up interrupt handling for omap4-keypad
Date:   Sun, 10 Jan 2021 21:05:24 +0200
Message-Id: <20210110190529.46135-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series updates omap4-keypad to disable unused long interrupts, and
implements the missing parts for the lost key-up interrupt quirk as
described in the silicon errata pdf.

These are based on Linux next with the following pending patch applied:

"Input: omap4-keypad - switch to use managed resources"

Regards,

Tony


Changes since v4:

- Rebase on Dmitry's devm patch

- Fix up kernel test robot warnings and mismerge of pm_ops when
  I rebased from v5.10 to Linux next

- Split up the patches further as suggested by Dmitry

Changes since v3:

- Use PM runtime to check the last pressed key is not stuck

- Simplify probe with devm

Changes since v2:

- Drop bogus level change, that already comes from device tree

- Scan keyboard in two phases and simplify using a bitmask

- Use mod_delayed_work and cancel_delayed_work_sync for the quirk

Tony Lindgren (5):
  Input: omap4-keypad - disable unused long interrupts
  Input: omap4-keypad - scan keys in two phases and simplify with
    bitmask
  Input: omap4-keypad - move rest of key scanning to a separate function
  Input: omap4-keypad - use PM runtime autosuspend
  Input: omap4-keypad - implement errata check for lost key-up events

 drivers/input/keyboard/omap4-keypad.c | 172 ++++++++++++++++++++------
 1 file changed, 132 insertions(+), 40 deletions(-)

-- 
2.30.0
