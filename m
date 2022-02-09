Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668874AEDBB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Feb 2022 10:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiBIJOQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Feb 2022 04:14:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiBIJN5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Feb 2022 04:13:57 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0626EE081A27
        for <linux-omap@vger.kernel.org>; Wed,  9 Feb 2022 01:13:51 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d27so2856290wrc.6
        for <linux-omap@vger.kernel.org>; Wed, 09 Feb 2022 01:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0mMsOE75ExnXzLMyN1DICR7rPwmbcyosABgNwZcDRT4=;
        b=bcbxiU3M5YLFDi04PbIH4UGizod5zZyKMa5h8g3LQzF3ItPFHf6OPaoJO5mzTmTnne
         vyTVT/N/9sgSE7bxYJ7MgScNA5eAm4UFSeHb6aFd4FA77FNppeL6fSf31ssOFuPKaCJV
         Z1bMehnTHvCTR657ihx7l+41sh4PFO9iPorqcZ6OrNaaSTgyXFn7ZkpHHTmOee4WYhNG
         K0YZzU2ihTeKE/RTq0duhBGsqlFOCr9O3JiYloTicwzS0QJqOgEPFYAzutnJveT8WMed
         SJ0hJ1MY98vapbzBW2zqq1ehxiEj0nymEv3fPJpRSj5leE4VXKeWDkrxHOkDKyqs/Sme
         QXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0mMsOE75ExnXzLMyN1DICR7rPwmbcyosABgNwZcDRT4=;
        b=0wIovoA8DW0hoasV9ruJrpob5GfjL9rUuLccvvnC/MddBihU87+eXFRAalRCy50KIx
         p+kUB4W4K5dw4bJKtM7ixK77itRghRyHHTh8yo5/H+GSS60+6O+Tluxi+YZsecOqCydU
         /9Fq4rTYB+Ac5lduyQT73XCRrIeNyJOTD+Ub1McaABPFDpiOFy3b2XJekxUXE1wvu7du
         FWKaRYjIy0pIDC3B7Hk5ykbz2W6ffrHZY1L7S8NfcgDJ743p4CmI0KnBszpoyUFWa7e/
         +6dXklrePFvChVzPFqgGG4mtD4UnVCRKbnzdTh/k0zk1RzxF1Ex0v3OUAz/l1pb3ZxGI
         B/nw==
X-Gm-Message-State: AOAM530AFNM13evkgRbG2eKqYLKF9kxj2BNEPMWdu7tCJ9+09JNK5P/i
        F3S+N+TclW83xhyTqlwzwpWw9w==
X-Google-Smtp-Source: ABdhPJxXY21MS3b9Y+ZmT1iGFF6ag9HX/FJBVnLGL3QUJmSb/8ppbsMCPO31PIOfk/UbvQhgEwEiyw==
X-Received: by 2002:a5d:5709:: with SMTP id a9mr813294wrv.74.1644398028282;
        Wed, 09 Feb 2022 01:13:48 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id y1sm5018248wmi.36.2022.02.09.01.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 01:13:47 -0800 (PST)
Message-ID: <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
Date:   Wed, 9 Feb 2022 10:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: AM5749: tty serial 8250 omap driver crash
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <YgDSj7FJS7nbkJol@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 07/02/2022 à 09:04, Tony Lindgren a écrit :
> Hi,
> 
> * Romain Naour <romain.naour@smile.fr> [220204 13:39]:
>> It seems that the driver fail to read the UART_LCR register from
>> omap8250_set_mctrl():
>>
>> "lcr = serial_in(up, UART_LCR);"
>>
>> PC is at mem_serial_in+0x2c/0x30
>> LR is at omap8250_set_mctrl+0x48/0xb0
>>
>> The problem only occurs with a -rt kernel, I tried with several kernel version:
>> 5.10-rt, 5.15-rt and 5.17-rt.
>>
>> I'm not able to reproduce the issue with a standard kernel.
> 
> Interesting, what's the exception you get with the -rt kernel? Is it an
> unhandled external abort or something else?

"asynchronous external abort"

Unhandled fault: asynchronous external abort (0x1211) at 0x00000000
pgd = bfdf645d
[00000000] *pgd=862cf003, *pmd=27df1b003
Internal error: : 1211 [#1] PREEMPT_RT SMP ARM
Modules linked in: cmac algif_hash cbc aes_arm_bs crypto_simd cryptd
algif_skcipher af_alg usbhid prueth xhci_plat_hcd irq_pruss_intc xhci_hcd
usbcore pru_rproc icss_iep pvrsr
vkm(O) omap_wdt phy_omap_usb2 ahci_platform libahci_platform omap_aes_driver
pruss libahci libata dwc3 roles udc_core usb_common wl18xx wlcore mac80211
ti_vpe ti_sc ti_csc ti_vpdma dwc3_omap
 wlcore_sdio hci_uart btbcm bluetooth omap_des ecdh_generic libdes ecc
omap_crypto omap_sham crypto_engine omap_remoteproc sch_fq_codel
CPU: 0 PID: 377 Comm: gpsmon Tainted: G        W  O      5.10.87-rt59+ #97
Hardware name: Generic DRA74X (Flattened Device Tree)
PC is at omap8250_set_mctrl+0x38/0xa0
LR is at omap8250_set_mctrl+0x38/0xa0
pc : [<c065f388>]    lr : [<c065f388>]    psr: 60000013
sp : c6327ca0  ip : c6327c74  fp : c4754500
r10: c6327f10  r9 : 00000000  r8 : c22698c8
r7 : ffffe000  r6 : c205ac40  r5 : 00000006  r4 : c12eccd8
r3 : fa06e00c  r2 : 00000002  r1 : 00000003  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 30c5387d  Table: 859817c0  DAC: fffffffd
Process gpsmon (pid: 377, stack limit = 0xaa83ac51)
Stack: (0xc6327ca0 to 0xc6328000)

Sometime after the trace, the kernel panic due to an "exception in interrupt"

[<c024d894>] (__task_rq_lock) from [<c0253148>] (rt_mutex_setprio+0x54/0x4b8)
[<c0253148>] (rt_mutex_setprio) from [<c0276374>]
(task_blocks_on_rt_mutex+0x2a4/0x374)
[<c0276374>] (task_blocks_on_rt_mutex) from [<c0ac7888>]
(rt_spin_lock_slowlock_locked+0xb8/0x2c4)
[<c0ac7888>] (rt_spin_lock_slowlock_locked) from [<c0ac7ae8>]
(rt_spin_lock_slowlock+0x54/0x84)
[<c0ac7ae8>] (rt_spin_lock_slowlock) from [<c0ac9524>] (rt_spin_lock+0x50/0x5c)
[<c0ac9524>] (rt_spin_lock) from [<c0661034>] (omap8250_irq+0x48/0x350)
[<c0661034>] (omap8250_irq) from [<c027e490>] (irq_forced_thread_fn+0x28/0x98)
[<c027e490>] (irq_forced_thread_fn) from [<c027e830>] (irq_thread+0x12c/0x214)
[<c027e830>] (irq_thread) from [<c024704c>] (kthread+0x18c/0x1dc)
[<c024704c>] (kthread) from [<c0200140>] (ret_from_fork+0x14/0x34)

I guess it's due to the previous issue in omap8250_set_mctrl().

> 
>> While looking at the git history, I noticed this commit [3] about "flakey idling
>> of uarts and stop using swsup_sidle_act".
>>
>> So I removed the SYSC_QUIRK for uart IP revision 0x50411e03 and it fixed my issue.
> 
> Hmm.
> 
>> Is the SYSC_QUIRK for omap4 still needed ? Is it safe to remove it ?
>> It seems this issue was introduced while dropping the legacy platform data
>> (between 4.19 and 5.4 kernels).
> 
> AFAIK it's still needed, but maybe we can disable it for am57xx though.

Since I removed the quirk I have other issues while using the serial interface.

I had once a backtrace related to omap_8250_rx_dma_flush with
CONFIG_SERIAL_8250_DMA enabled.

WARNING: CPU: 0 PID: 449 at drivers/tty/serial/8250/8250_omap.c:916
omap_8250_rx_dma_flush+0xec/0xf4
Modules linked in: cmac algif_hash aes_arm aes_generic algif_skcipher af_alg
usbhid xhci_plat_hcd xhci_hcd usbcore irq_pruss_intc prueth pru_rproc icss_iep
omap_wdt pvrsrvkm(
O) phy_omap_usb2 ahci_platform libahci_platform omap_aes_driver pruss libahci
libata dwc3 roles udc_core usb_common wl18xx wlcore mac80211 sha256_generic
libsha256 sha256_arm cfg80211 ti_vp
e ti_sc ti_csc ti_vpdma dwc3_omap wlcore_sdio hci_uart btbcm bluetooth omap_hdq
omap_des ecdh_generic omap_crypto ecc wire libdes libaes omap_sham crypto_engine
sch_fq_codel
CPU: 0 PID: 449 Comm: irq/122-4806e00 Tainted: G           O      5.10.87-rt59+ #91
Hardware name: Generic DRA74X (Flattened Device Tree)
[<c020e19c>] (unwind_backtrace) from [<c0209ef0>] (show_stack+0x10/0x14)
[<c0209ef0>] (show_stack) from [<c0b064b8>] (dump_stack+0x98/0xac)
[<c0b064b8>] (dump_stack) from [<c0b02410>] (__warn+0xcc/0xe4)
[<c0b02410>] (__warn) from [<c0b0248c>] (warn_slowpath_fmt+0x64/0xc8)
[<c0b0248c>] (warn_slowpath_fmt) from [<c06ae5c4>]
(omap_8250_rx_dma_flush+0xec/0xf4)
[<c06ae5c4>] (omap_8250_rx_dma_flush) from [<c06b0610>] (omap8250_irq+0x34c/0x350)
[<c06b0610>] (omap8250_irq) from [<c02836a0>] (irq_forced_thread_fn+0x28/0x98)
[<c02836a0>] (irq_forced_thread_fn) from [<c0283a40>] (irq_thread+0x12c/0x214)
[<c0283a40>] (irq_thread) from [<c0248d94>] (kthread+0x18c/0x1dc)
[<c0248d94>] (kthread) from [<c0200140>] (ret_from_fork+0x14/0x34)
Exception stack(0xc38b1fb0 to 0xc38b1ff8)
1fa0:                                     00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000

To ease investigation, I disabled CONFIG_SERIAL_8250_DMA for now.


I noticed other side effect when opening the serial interface:

omap8250 4806e000.serial: Errata i202: timedout 0

cpsw-switch 48484000.switch: cpts: obtain a time stamp timeout

sched: RT throttling activated

thermal thermal_zone5: failed to read out thermal zone (-121)

It takes several seconds to open the serial interface, something hang somewhere
in the kernel.

Maybe there is something wrong with the smart-standby or smart-idle feature in
the UART IP ? I'm not sure.

Are you able to reproduce it ?
Maybe on a IDK574 or a Beaglebone-AI board ?

Best regards,
Romain


> 
> Regards,
> 
> Tony

