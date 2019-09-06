Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F34ABB91
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 16:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731750AbfIFO6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 10:58:48 -0400
Received: from hosting.pavoucek.net ([46.28.107.168]:57214 "EHLO
        hosting.pavoucek.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbfIFO6s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Sep 2019 10:58:48 -0400
X-Greylist: delayed 456 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Sep 2019 10:58:47 EDT
Received: from tomas.local.tbs-biometrics.cz (176-74-132-138.netdatacomm.cz [176.74.132.138])
        (Authenticated sender: tomas@novotny.cz)
        by hosting.pavoucek.net (Postfix) with ESMTPSA id 4B03E102F9E;
        Fri,  6 Sep 2019 16:51:09 +0200 (CEST)
Date:   Fri, 6 Sep 2019 16:51:09 +0200
From:   Tomas Novotny <tomas@novotny.cz>
To:     linux-omap@vger.kernel.org, alsa-devel@alsa-project.org
Subject: omap-mcbsp: TX Buffer Overflow
Message-ID: <20190906165109.53c5a306@tomas.local.tbs-biometrics.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

we have AM3703 based board similar to BeagleBoard. I'm hitting this error
after upgrade to latest LTS 4.19.71 (upgraded from 4.1):

omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!

This appears during or after playing of short (~2s) ding-dong wav. That error
exists for longer time, because handling of tx buffer overflow irq was
introduced in 2016: 4e85e7776eba ("ASoC: omap-mcbsp: Enable TX/RX under and
overflow interrupts"). I've cherry-picked it to 4.1 and I see the error there also.
The sound seems clear and ok to me, but we are using low quality speaker.

There are two workarounds to get rid of the message:
1) Change 'dma_op_mode' sysfs attribute from 'element' to 'threshold'. I
found that just by coincidence when checking sysfs attributes.
2) Compile kernel with CONFIG_VIDEO_OMAP3=y. Found on Logic PD forum [1].

Does anybody have any idea what's going wrong? Or why these (somehow)
unrelated workarounds help?

Thanks,

Tomas

[1] https://support.logicpd.com/TDGForum/tabid/124/aft/2277/Default.aspx
