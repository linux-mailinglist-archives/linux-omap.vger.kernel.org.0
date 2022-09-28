Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54AAE5ED651
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 09:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbiI1Hhu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 03:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbiI1HhV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 03:37:21 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C70BD10B21C;
        Wed, 28 Sep 2022 00:36:22 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 14B8D80B3;
        Wed, 28 Sep 2022 07:21:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Romain Naour <romain.naour@smile.fr>
Subject: [RFC PATCH 0/5] 8250_omap fixes for testing
Date:   Wed, 28 Sep 2022 10:29:29 +0300
Message-Id: <20220928072934.48359-1-tony@atomide.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here are some 8250_omap fixes for testing. I'm not sure if the first patch
fixes the issue reported. I'm not sure if I've seen that one, so please test.

The other patches are for all kind of issues I started running into after
testing rebinding the driver.

These are tagged RFC as we're close to the merge window, I'll repost the
series probably after -rc1 after folks have tested this a bit. It seems
that all these issues have been around for quite a long time.

Regards,

Tony


Tony Lindgren (5):
  serial: 8250: omap: Fix missing PM runtime calls for
    omap8250_set_mctrl()
  serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in
    omap8250_remove()
  serial: 8250: omap: Flush PM QOS work on remove
  serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
  serial: 8250: omap: Fix life cycle issues for interrupt handlers

 drivers/tty/serial/8250/8250_omap.c | 140 +++++++++++++++++-----------
 1 file changed, 84 insertions(+), 56 deletions(-)

-- 
2.37.3
