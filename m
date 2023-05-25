Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B34971051B
	for <lists+linux-omap@lfdr.de>; Thu, 25 May 2023 07:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240031AbjEYFCI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 May 2023 01:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240035AbjEYFB1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 May 2023 01:01:27 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B797410FE
        for <linux-omap@vger.kernel.org>; Wed, 24 May 2023 21:54:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2EA2B80F5;
        Thu, 25 May 2023 04:53:42 +0000 (UTC)
Date:   Thu, 25 May 2023 07:53:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
        linux-omap@vger.kernel.org, Letux-kernel@openphoenux.org
Subject: Re: OMAP4/5 AESS on v6.4
Message-ID: <20230525045340.GA14287@atomide.com>
References: <FFF13275-327A-4E3C-95E5-88B6A376F582@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FFF13275-327A-4E3C-95E5-88B6A376F582@goldelico.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [230524 07:40]:
> Hi Tony and Peter,
> I have upgraded my WIP tree to v6.4-rc3 now.
> 
> It is almost working, firmware can be built, and is loaded, subdevices are presented, graph
> has been verified against the working 3.15 version, legacy sound works, amixer settings are
> fine, etc.
> 
> The last remaining issue (before the next reveals itself) is that the AE DSP isn't running.
> Playing a sound gets stuck in wait_for_avail() in sound/core/pcm_lib.c obviously waiting for 
> some interrupt or DMA trigger from the DSP.
> 
> Kernel log/user-space symptoms are:
> 
> [   36.957956] omap-abe-twl6040 sound: playback write error (DMA or IRQ trouble?)
> play WARN alsa: Input/output error
> 
> So it may either be a clocking or power issue or something with initialization.
> Very difficult to find. Also symptomatic seems to be that I can hex-dump the /sys/kernel/debug
> files for cmem, dmem, and smem but not pmem.
> 
> 
> Therefore I am currently going once again through all questionable code where I
> had noted a FIXME to tell that it is obviously not compatible to modern
> kernels and has not yet been fixed.
> 
> 
> One such place is
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=blob;f=sound/soc/ti/aess/omap-aess-pcm.c;h=e9c8b9a00f032f336cac8cbb7e441ce8a7476507;hb=74db6d179bad60cdad29a8704f9e606f8cffccd3#l673
> 
> where there is a "context-lost mechanism" which was removed in v4.18.
> 
> Any ideas what that "context lost" is or how it can be fixed in modern kernels?

There does not seem to be a Linux framework directly usable for this, maybe
the reset framework could be used with addition of some kind of reset status
function.

Initially for your driver, you could simply always restore the context in
runtime PM resume to start with. You could also check some driver registers for
context lost status in the driver as the context lost registers are outside
the driver IO range. And after that, using reset framework for context lost
status could be done, maybe by adding support to drivers/soc/ti/omap_prm.c.

> You may also try or review the full tree:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/aess-6.4-rc3
> 
> I haven't tried that as a stand-alone without my other local Letux patches for my
> devices, but I think it can run at least on PandaES and omap5uevm after configuring
> omap2plus_defconfig.
> 
> Building firmware is best done on the device and running a script like this one:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=blob;f=Letux/root/build-aess-fw;h=0bfe59559e5395fb1e5ad32bbbac676d7665aa22;hb=refs/heads/letux-current
> 
> This clones the kernel git repo and tries to build the firmware on the target device.
> I have only tested on Debian 9.13. Other releases may reveal subtle conflicts in system
> include files...
> 
> 
> Any help (also by readers) to get this beast finally working is welcome.

Based on a quick glance it looks like pretty much a standard Linux driver
that loads firmware :)

Regards,

Tony
