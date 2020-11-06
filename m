Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406152A928A
	for <lists+linux-omap@lfdr.de>; Fri,  6 Nov 2020 10:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgKFJ1q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 6 Nov 2020 04:27:46 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:24311 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFJ1p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Nov 2020 04:27:45 -0500
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSYXA4JMOs="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id d04888wA69RR0PU
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 6 Nov 2020 10:27:27 +0100 (CET)
Subject: Re: [Letux-kernel] [REGRESSION] opp: Allow dev_pm_opp_get_opp_table() to return -EPROBE_DEFER
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20201106085810.ubo3cikbg33x76lt@vireshk-i7>
Date:   Fri, 6 Nov 2020 10:27:26 +0100
Cc:     Andreas Kemnade <andreas@kemnade.info>, vireshk@kernel.org,
        nm@ti.com, ulf.hansson@linaro.org, stephan@gerhold.net,
        khilman@kernel.org, sboyd@kernel.org, linux-pm@vger.kernel.org,
        rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <1600E1F6-2819-4858-9843-B29264F4C2E6@goldelico.com>
References: <20201106001018.02200778@aktux> <20201106041441.uuz5vrtqeyn6ijdv@vireshk-i7> <8728D936-6583-407F-96CF-92AE95AAECDF@goldelico.com> <20201106085810.ubo3cikbg33x76lt@vireshk-i7>
To:     Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 06.11.2020 um 09:58 schrieb Viresh Kumar <viresh.kumar@linaro.org>:
> 
> On 06-11-20, 09:44, H. Nikolaus Schaller wrote:
>> 
>>> Am 06.11.2020 um 05:14 schrieb Viresh Kumar <viresh.kumar@linaro.org>:
>>> 
>>> On 06-11-20, 00:10, Andreas Kemnade wrote:
>>>> Hi,
>>>> 
>>>> On the GTA04 (DM3730, devicetree omap3-gta04*) I get my console flooded
>>>> up with the following:
>>>> [   24.517211] cpu cpu0: multiple regulators are not supported
>>>> [   24.523040] cpufreq: __target_index: Failed to change cpu frequency: -22
>>>> [   24.537231] ------------[ cut here ]------------
>>>> [   24.542083] WARNING: CPU: 0 PID: 5 at drivers/opp/core.c:678 dev_pm_opp_set_rate+0x23c/0x494
>>>> [   24.551086] Modules linked in: usb_f_ecm g_ether usb_f_rndis u_ether libcomposite configfs phy_twl4030_usb omap2430 musb_hdrc overlay
>>>> [   24.563842] CPU: 0 PID: 5 Comm: kworker/0:0 Tainted: G        W         5.9.0-rc1-00008-g629238068eb9 #14
>>>> [   24.573852] Hardware name: Generic OMAP36xx (Flattened Device Tree)
>>>> [   24.580413] Workqueue: events dbs_work_handler
>>>> [   24.585083] [<c010e6b4>] (unwind_backtrace) from [<c010a194>] (show_stack+0x10/0x14)
>>>> [   24.593200] [<c010a194>] (show_stack) from [<c0464ad0>] (dump_stack+0x8c/0xac)
>>>> [   24.600769] [<c0464ad0>] (dump_stack) from [<c01276a8>] (__warn+0xcc/0xe4)
>>>> [   24.608001] [<c01276a8>] (__warn) from [<c0127a3c>] (warn_slowpath_fmt+0x74/0xa0)
>>>> [   24.615844] [<c0127a3c>] (warn_slowpath_fmt) from [<c06364ac>] (dev_pm_opp_set_rate+0x23c/0x494)
>>>> [   24.625061] [<c06364ac>] (dev_pm_opp_set_rate) from [<c063ec08>] (set_target+0x2c/0x4c)
>>>> [   24.633453] [<c063ec08>] (set_target) from [<c063a950>] (__cpufreq_driver_target+0x190/0x22c)
>>>> [   24.642395] [<c063a950>] (__cpufreq_driver_target) from [<c063d4e0>] (od_dbs_update+0xcc/0x158)
>>>> [   24.651489] [<c063d4e0>] (od_dbs_update) from [<c063e090>] (dbs_work_handler+0x2c/0x54)
>>>> [   24.659881] [<c063e090>] (dbs_work_handler) from [<c013f71c>] (process_one_work+0x210/0x358)
>>>> [   24.668731] [<c013f71c>] (process_one_work) from [<c0140014>] (worker_thread+0x22c/0x2d0)
>>>> [   24.677307] [<c0140014>] (worker_thread) from [<c0144eac>] (kthread+0x140/0x14c)
>>>> [   24.685058] [<c0144eac>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)
>>>> [   24.692626] Exception stack(0xde4b7fb0 to 0xde4b7ff8)
>>>> [   24.697906] 7fa0:                                     00000000 00000000 00000000 00000000
>>>> [   24.706481] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>>> [   24.715057] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>>>> [   24.722198] ---[ end trace 038b3f231fae6f81 ]---
>>>> 
>>>> endlessly after the $subject commit. Any hints?
>>> 
>>> The fix for this has been in linux-next for a couple of days and it
>>> made it to linus/master yesterday.
>>> 
>>> 47efcbcb340ic opp: Fix early exit from dev_pm_opp_register_set_opp_helper()
> 
> I think I may have accidentally pasted the wrong commit here. This is
> the one which must have fixed it for you.
> 
> commit 1f6620f87006 ("opp: Don't always remove static OPPs in _of_add_opp_table_v1()")

Well, I did a cross-check and git revert 47efcbcb340 made the problem come back.
Maybe both patches are good and the first one hides the missing second one.

What I haven't checked is if all opps are available now. I just looked for the omap to boot.

> 
> 
>> Seems to fix our problems on gta04 (OMAP3).
>> Otherwise we would have found that v5.10-rc3 magically solves it :)
> 
> I assume you just ran linus's/master, otherwise the patch I shared
> earlier won't have fixed the issue :)

Yes, we just test with v5.10-rc2 and wait for -rc3 to come in some days.

> 
>> Interestingly it did not affect OMAP5.
> 
> Based on the DT I saw for omap5, it does use OPPv1 and so it shouldn't
> have worked as well. It may be worth checking why it didn't get
> affected earlier.
> 
> You can see the populated OPPs for a platform with this:
> 
> ls /sys/kernel/debug/opp/cpu*/*
> 
> You shall see some difference with and without this patch. Or it may
> be the case that you are adding dynamic OPPs with dev_pm_opp_add() and
> so even after removing the static ones, it worked (though I wasn't
> able to find that in the code).

Ah, now as you tell this I remember that the last test on omap5 did not
have any cpufreq info output. Although it did boot to login:.

So I did not see a common reason in these quite different symptoms.

I am sure that with -rc3 omap3 & omap5 will be ok again and I'll take a
special look at it when testing other things.

BR and thanks,
Nikolaus

