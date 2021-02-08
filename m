Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A252A312F07
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 11:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbhBHKa7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 05:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbhBHK2o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Feb 2021 05:28:44 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0A0C06178A
        for <linux-omap@vger.kernel.org>; Mon,  8 Feb 2021 02:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TXUfPaa3bR5B5l898qxMsoducOkDUa8GCT6ZIjIYxnc=; b=KtsVuAKZ2jPMPVC8RDKx7W47H3
        rg7eHyXQ0ZYEHDBSHu3biqHr+iPCV0R+guYa/0casA8Gps3IENuurk9K8k2LKgOLmmXdIDqRx27kk
        vmXMK3zriwtJG6P8J8/HdfNDqGxmGzc0fhCHQVOrAqpLN48gUbtuQ9AEQ57BmhQPBcTE=;
Received: from p200300ccff06e1001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:e100:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1l93lY-0005Dn-LA; Mon, 08 Feb 2021 11:27:36 +0100
Date:   Mon, 8 Feb 2021 11:27:35 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: DM3730 Suspend-Resume with 5.11-rc6
Message-ID: <20210208112735.02e85c3f@aktux>
In-Reply-To: <YCEBRBcfZa2D6J6X@atomide.com>
References: <CAHCN7xLXK774FTKVXPM1LQbg0KQm+7ASFxtiaYZsUbGKnwYfDQ@mail.gmail.com>
        <CAHCN7xKvUx7q0GL+JV8O7MEYo1zb8g2ePbHKQg8SxRmmsj+b6g@mail.gmail.com>
        <YCEBRBcfZa2D6J6X@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 8 Feb 2021 11:15:48 +0200
Tony Lindgren <tony@atomide.com> wrote:

> * Adam Ford <aford173@gmail.com> [210206 22:22]:
> > On Sat, Feb 6, 2021 at 3:57 PM Adam Ford <aford173@gmail.com> wrote:  
> > >
> > > I am having issues with suspend on a DM3730 running 5.11-rc6, and it
> > > seems like core_pwrdm may be the issue.  
> 
> That probably just means you did not configure off mode for idle.
> 

hmm, do you still need to configure anything for off mode? I rather
think it might be a misbehaving peripheral, not a general off mode
problem. So maybe try it with less modules loaded and add them step by
step to find out the misbehaving one.

> Suspend and resume still works for me based on a quick try with -rc7.
> I use the following test script to enable idle FYI, then suspend,
> and wake-up the system to a key press on serial console.
> 
> Also modprobe rtc-twl and rtcwake -m mem -s 5 worked.
> 
> Regards,
> 
> Tony
> 
> 8< -------------
> #!/bin/bash
> 
> # Detach kernel serial console
> consoles=$(find /sys/bus/platform/devices/4*.serial/ -name console)
> for console in ${consoles}; do
> 	echo -n N > ${console}
> done
> 
> # Configure PM runtime autosuspend
> uarts=$(find /sys/bus/platform/devices/4*.serial/power/ -type d)
> for uart in $uarts; do
> 	echo -n 3000 > $uart/autosuspend_delay_ms
> 	echo -n enabled > $uart/wakeup
> 	echo -n auto > $uart/control
> done
> 
> # Configure wake-up from suspend
> uarts=$(find /sys/class/tty/tty[SO]*/power/ -type d 2>/dev/null)
> for uart in $uarts; do
> 	echo -n enabled > $uart/wakeup
> done
> 
> echo -n 1 > /sys/kernel/debug/pm_debug/enable_off_mode
> 
Is this line still needed? I thought I had patched it away.

Regards,
Andreas
