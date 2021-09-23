Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B3E4164C8
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 20:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242621AbhIWSFB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 14:05:01 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54942 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241754AbhIWSFB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Sep 2021 14:05:01 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mTT48-00012b-Mg; Thu, 23 Sep 2021 21:03:24 +0300
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
 <YUsAffFIHUi1ZxEY@atomide.com>
 <cbe53e9f-b407-d758-67bb-5fb65bddfc03@bitmer.com>
 <YUwThz8SAdjBD+cn@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <93196bcd-836d-2432-9d1c-458904ba4f41@bitmer.com>
Date:   Thu, 23 Sep 2021 21:03:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUwThz8SAdjBD+cn@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/23/21 8:41 AM, Tony Lindgren wrote:
> * Jarkko Nikula <jarkko.nikula@bitmer.com> [210922 17:22]:
>> Better luck with this one but looks like idling cause "undefined
>> instruction" crash. Cache/memory etc corruption perhaps? Serial console
>> log attached.
> 
> Hmm. If you comment out the twl power node, does the omap3-beagle-ab4.dtb
> boot normally for you? It should behave the same as current mainline then
> with the omap3isp issue.
> 
Commenting the twl_power node out or removing the twl section leads to
immediately rebooting kernel:

Starting kernel ...



undefined instruction

pc : [<80008000>]          lr : [<8ff41c1d>]

reloc pc : [<701c7000>]    lr : [<80100c1d>]

sp : 8df20998  ip : 00000020     fp : 00000001

r10: 0000071f  r9 : 8df20ed0     r8 : 8df2e864

r7 : 00000000  r6 : 80008000     r5 : 8ff9f5dc  r4 : 00000000

r3 : 8df20fa8  r2 : 80000100     r1 : 0000060a  r0 : 00000000

Flags: nZCv  IRQs off  FIQs off  Mode SVC_32

Resetting CPU ...


>> I used the new omap3-beagle-ab4.dtb:
> 
> OK. So for your rev c2 board, does the new omap3-beagle.dtb boot and
> work for you?
> 
Booting with that alone doesn't output anything (with the patch applied).

Jarkko
