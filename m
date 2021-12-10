Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E89470EDA
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 00:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243665AbhLJXor (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 18:44:47 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43592 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243603AbhLJXor (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 18:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=xEPSTWYv9iM10z38AZcuecbxZCTTXrJF7FmCcjxuDe0=; b=bVYVSg3dFeJAEc24YOb9iMOC/I
        1VP0NOkZZOq28pHc3zeHiiE2UpxJxA0+CT2WFjttjXIlPlCOSw7fGZdOgpUSoJ24z1BJuLn3rD7Eu
        4hLLzVEc4hIfmMa7YJze9f3g2Flu+jpLwTlxhS+aN//TB+3qY0AGyzmY+O3SdHnF40QKSmCmc10qg
        7qedGucRz7+fFF4JLhfArwQI8LEbMZ7ql2fpnqfvcd9fLZFs5SaiIF+M1xKYZThnzs4Cd8K5pOKn4
        Y+AnBXFdIojmEsptrWENBOIc1WOIFm2ET6nlqqgA/XOJ7VDAdapXu+prO87aeqMa453pL227tRmfQ
        Mgu5uKOQ==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvpVh-0000qf-Iu; Fri, 10 Dec 2021 23:41:05 +0000
Subject: Re: Oops while booting 5.15.2 on Nokia N900
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz> <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
From:   Merlijn Wajer <merlijn@wizzup.org>
Message-ID: <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
Date:   Sat, 11 Dec 2021 00:46:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Aaro,

On 10/12/2021 12:13, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Dec 08, 2021 at 11:34:53PM +0100, Merlijn B.W. Wajer wrote:
>> What I have seen is that if off mode is enabled from userspace
>> (debugfs), it does not cause a problem (or I don't hit the problem at
>> least). That said, my off mode tests are pretty minimal with
>> init=/bin/sh, and I haven't gotten a fully booted (with lots of modules
>> loaded, gui and daemons) system to enter off mode yet.
> 
> I also started seeing crashes with fb2c599f0566 on N900. It's been several
> months since I last tested, but I remember I was able to trigger the
> crashes reliably with MMC access from the minimal shell enviroment.
> I see the MMC is also visible in your crash logs. My test case was
> something like "sleep 30 ; blkid ; sleep 30".

Thanks for this info -- I can confirm, I see the same when I do this:

1. boot to init=/bin/bash

2. run:

> modprobe panel-sony-acx565akm
> 
> mount -t proc none /proc
> mount -t sysfs none /sys
> mount -t debugfs none /sys/kernel/debug
> mount -o rw,remount /
> 
> echo 1 > /sys/kernel/debug/pm_debug/enable_off_mode
> echo 0 > /sys/class/backlight/acx565akm/brightness

3. run:

> sleep 30 ; blkid

So we have a pretty reproducible test case here I think.

Regards,
Merlijn
