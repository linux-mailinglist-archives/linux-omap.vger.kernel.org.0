Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D46C18A8B8
	for <lists+linux-omap@lfdr.de>; Wed, 18 Mar 2020 23:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCRW5f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 18:57:35 -0400
Received: from muru.com ([72.249.23.125]:60764 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgCRW5f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 18:57:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1462D80B6;
        Wed, 18 Mar 2020 22:58:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: [PATCHv3 0/3] Lost key-up interrupt handling for omap4-keypad
Date:   Wed, 18 Mar 2020 15:57:24 -0700
Message-Id: <20200318225727.29327-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

This series updates omap4-keypad to disable unused long interrupts, and
implements the missing parts for the lost key-up interrupt quirk as
described in the silicon errata pdf.

Regards,

Tony


Changes since v2:

- Drop bogus level change, that already comes from device tree

- Scan keyboard in two phases and simplify using a bitmask

- Use mod_delayed_work and cancel_delayed_work_sync for the quirk


Tony Lindgren (3):
  Input: omap4-keypad - disable unused long interrupts
  Input: omap4-keypad - Scan keys in two phases and simplify with
    bitmask
  Input: omap4-keypad - check state again for lost key-up interrupts

 drivers/input/keyboard/omap4-keypad.c | 124 ++++++++++++++++++++------
 1 file changed, 95 insertions(+), 29 deletions(-)

-- 
2.25.1
