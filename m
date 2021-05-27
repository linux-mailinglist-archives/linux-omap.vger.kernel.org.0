Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B155839361A
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 21:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbhE0TQn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 15:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhE0TQm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 May 2021 15:16:42 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB30C061574;
        Thu, 27 May 2021 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MHosepZjuNsP8DuB67duFDw5qs/I1WA/YNwlH4XuuEA=; b=GtRoFHa9mTELSr7Wr7JUpNOl0D
        SCNy96BLWyCnk7gUacs2w0nBIB6KNiYQivtRSIc7wiQQG84LvMRtlbnf+sDCeguaan0JjUg7fG1xB
        +dsR3UbXOAWxUg6mBT/P0if7EzJUcpYdJLjfDQMJ0X4/s/TUbsvy08K7Hx6ajWk2g94A=;
Received: from p200300ccff1430001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff14:3000:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lmLTC-0003d0-By; Thu, 27 May 2021 21:15:02 +0200
Date:   Thu, 27 May 2021 21:15:01 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210527211501.70d176b4@aktux>
In-Reply-To: <20210518150615.53464-1-tony@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, 18 May 2021 18:06:15 +0300
Tony Lindgren <tony@atomide.com> wrote:

> On start-up, we can get a spurious session request interrupt with nothing
> connected. After that the devctl session bit will silently clear, but the
> musb hardware is never idled until a cable is plugged in, or the glue
> layer module is reloaded.
> 
> Let's just check the session bit again in 3 seconds in peripheral mode
> to catch the issue.
> 
Tested this together with the other musb patch you sent on gta04.
This has some interesting side effects.

Test done:
- loading kernel+ramdisk via usb-dfu
- disconnecting usb cable
- loading omap_hdq (to see battery status)
- idling serial ports
- checking battery current 1.
- loading omap2430, phy-twl4030-usb, g_ether
- checking battery current 2 (again with idled serial ports).
- rtcwake -s 20 -m mem
- checking current during suspend (3)

Without your patches: current 2 is current 1 + approx 15 mA, current 3
is near current 1.
With your patches: current 2 is near current 1, current 3 is approx
15mA higher.

Another strange thing I have hit (I have not done this test before, no
idea yet if it is related, but it is also about musb):
Connecting a usb cable while serial ports are idle (not in system
supend), console serial port does not wake up by input, it reacts again
if I unplug usb. If I give usb0 an IP address, I can ping it. No
intensive debugging done there yet. Just stumbled across it.

Regards,
Andreas
