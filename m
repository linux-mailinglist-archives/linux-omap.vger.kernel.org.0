Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1AD3CA1C7
	for <lists+linux-omap@lfdr.de>; Thu, 15 Jul 2021 17:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239415AbhGOQCW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Jul 2021 12:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239648AbhGOQCW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Jul 2021 12:02:22 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD504C06175F
        for <linux-omap@vger.kernel.org>; Thu, 15 Jul 2021 08:59:28 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id j3so3614366plx.7
        for <linux-omap@vger.kernel.org>; Thu, 15 Jul 2021 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=+2u6sv362V4RQ8qlXFVS/RSl83247XmpPzGLcc3Y12A=;
        b=bgFhHZgmJwcTbKyJXXax9o6H+i1Qy8PgfuoL04aQptj7CiibYMpvPUyU6nBcClPE6W
         r1ghmHz9ruDeGCE9DcX+3LQgftQ9WMlUQS8uroph3hlfHQP5LHS33xkbUUdlPKth0haH
         ro9f4TNrLtgbCOPzPU9Yr9en4U05TiJfSPO+waxXZp5vGXryqcKw6/XCHzwiKm2TSwPj
         XaS6OcvxZdltIjmXbYDhIYZ/ZLNS4p0H7E97FDqJz4OP+VJ7bKAmT0x+599C0PbRTlo/
         eH/xrfqtTnAQg3BYE9AU+MgL0s7TqUgkgjNc0CKRrSkKFlbWP7K/CH7MxB23z1rWYhfD
         5rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=+2u6sv362V4RQ8qlXFVS/RSl83247XmpPzGLcc3Y12A=;
        b=XgoRI9qsZ3If0+7XcfcjcFdirLyOITZwk+v6Fqx4yapDu/7P2KuGi4jfUs4pqNnD8K
         5Gzqe5jOqhZDaHRmiJC6SvobdboT0orMlPr/iH/5nCQMtWbIojppEaAc4wPRB7CAQMXs
         4wyVxz3Mz4o/clRYiWFoK8WnCkdFkHJUwTfGkQBqGoZrwwpGby0zFt1J+uDs8npnJJD4
         b9G91NvgfGH6M67A97Paq7oWE6olEILYEvDnMMOxK62plb5QGsKnkW009XQyn1u2SLJx
         zlt2TRBUZI09j2Jy7njzQL9V5MjV0Hdrtpemrgba/OUBrQunTWYUe+6FxHIKUQlEhDIH
         Ltwg==
X-Gm-Message-State: AOAM530oIZwFYxAIg41MBGA4km2osx2KngE1WyocZEd2joSLK4jy2lrg
        91WqOgM5RD9S5379LwRbhCn2zQtVElI=
X-Google-Smtp-Source: ABdhPJwaW4Dls02YipgKQu8MOWuG9/SPHCkYXxMFNUuWlOhVjAygNw2n3VIaV3C9/Lwji+gQTIEWKg==
X-Received: by 2002:a17:90a:bb90:: with SMTP id v16mr5178436pjr.162.1626364768331;
        Thu, 15 Jul 2021 08:59:28 -0700 (PDT)
Received: from [172.20.7.75] (098-154-044-066.biz.spectrum.com. [98.154.44.66])
        by smtp.gmail.com with ESMTPSA id v9sm6921338pfn.22.2021.07.15.08.59.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 08:59:27 -0700 (PDT)
From:   David Russell <david.russell73@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: OMAP2430 kernel hangs on call to omap2xxx_restart
Message-Id: <98FB70B0-F4B6-4B9E-8207-92830DBD5145@gmail.com>
Date:   Thu, 15 Jul 2021 08:59:26 -0700
Cc:     linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Good morning,

I have a legacy project that runs on an OMAP2430 and is based on the =
linux-omap repo (tag v2.6.28-omap1).  I am in the process of upgrading =
the project to mainline v5.10.  I have hit a problem with calling =
/sbin/reboot which eventually calls omap2xxx_restart which attempts to =
set a clock rate, but when it does is dereferences a null pointer =
because the clock was never registered successfully:

[   21.966247] 8<--- cut here ---
[   21.969360] Unable to handle kernel NULL pointer dereference at =
virtual address 00000016
[   21.977508] pgd =3D 61c95805
[   21.980255] [00000016] *pgd=3D81857831, *pte=3D00000000, =
*ppte=3D00000000
[   21.986633] Internal error: Oops: 17 [#1] PREEMPT ARM
[   21.991729] CPU: 0 PID: 904 Comm: linuxrc Not tainted =
5.10.0-bsp-5.8.23 #3
[   21.998657] Hardware name: BKR-5000
[   22.002197] PC is at clk_set_rate+0x18/0x5c
[   22.006439] LR is at __mutex_trylock+0x50/0x7c
[   22.010925] pc : [<c02ae184>]    lr : [<c0145dec>]    psr: 60000093
[   22.017242] sp : c18c1e60  ip : 00000000  fp : 00000000
[   22.022521] r10: 00000000  r9 : c18c0000  r8 : 00000000
[   22.027770] r7 : c090c734  r6 : 4321fedc  r5 : fffffffe  r4 : =
00000000
[   22.034362] r3 : 00000001  r2 : c19f1580  r1 : 00000000  r0 : =
00000001
[   22.040924] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  =
Segment none
[   22.048217] Control: 00c5387d  Table: 81860000  DAC: 00000051
[   22.054016] Process linuxrc (pid: 904, stack limit =3D 0x31ca9ab0)
[   22.060058] Stack: (0xc18c1e60 to 0xc18c2000)
[   22.064483] 1e60: c0113110 c098e308 c0903208 c011312c 01234567 =
c01075a4 c11285d9 01234567
[   22.072723] 1e80: c0903208 c0138af4 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.080993] 1ea0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.089233] 1ec0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.097473] 1ee0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.105743] 1f00: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.113983] 1f20: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.122253] 1f40: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   22.130493] 1f60: 00000000 00000000 c18c1f94 c013be7c 00000000 =
00000000 00000000 00000000
[   22.138732] 1f80: 00000000 00000000 00000000 c11285d9 00000000 =
00000000 ffffffff 00000058
[   22.147003] 1fa0: c0100244 c0100060 00000000 00000000 fee1dead =
28121969 01234567 00000000
[   22.155242] 1fc0: 00000000 00000000 ffffffff 00000058 00000071 =
00000000 b6ffd000 00000000
[   22.163513] 1fe0: 000bd14c befff990 000815e0 b6eb9c68 60000010 =
fee1dead 00000000 00000000
[   22.171813] [<c02ae184>] (clk_set_rate) from [<c011312c>] =
(omap2xxx_restart+0x1c/0x28)
[   22.179809] [<c011312c>] (omap2xxx_restart) from [<c01075a4>] =
(machine_restart+0x28/0x74)
[   22.188079] [<c01075a4>] (machine_restart) from [<c0138af4>] =
(__do_sys_reboot+0xdc/0x1cc)
[   22.196350] [<c0138af4>] (__do_sys_reboot) from [<c0100060>] =
(ret_fast_syscall+0x0/0x54)
[   22.204498] Exception stack(0xc18c1fa8 to 0xc18c1ff0)
[   22.209594] 1fa0:                   00000000 00000000 fee1dead =
28121969 01234567 00000000
[   22.217834] 1fc0: 00000000 00000000 ffffffff 00000058 00000071 =
00000000 b6ffd000 00000000
[   22.226104] 1fe0: 000bd14c befff990 000815e0 b6eb9c68
[   22.231201] Code: e92d4038 e1a05000 e1a04001 ebfff649 (e5953018)
[   22.237365] ---[ end trace 6de58b88c9253e89 ]=E2=80=94

In arch/arm/mach-omap2/omap2-restart.c is the restart code:

static struct clk *reset_virt_prcm_set_ck, *reset_sys_ck;

/* Reboot handling */

/**
 * omap2xxx_restart - Set DPLL to bypass mode for reboot to work
 *
 * Set the DPLL to bypass so that reboot completes successfully.  No
 * return value.
 */
void omap2xxx_restart(enum reboot_mode mode, const char *cmd)
{
        u32 rate;

        rate =3D clk_get_rate(reset_sys_ck);
        clk_set_rate(reset_virt_prcm_set_ck, rate);

        /* XXX Should save the cmd argument for use after the reboot */

        omap_prm_reset_system();
}

I have found that when the kernel is first started the =
=E2=80=9Cvirt_prcm_set=E2=80=9D clock is registered in =
arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c:

/**
 * omap2xxx_clkt_vps_init - initialize virt_prcm_set clock
 *
 * Does a manual init for the virtual prcm DVFS clock for OMAP2. This
 * function is called only from omap2 DT clock init, as the virtual
 * node is not modelled in the DT clock data.
 */
void omap2xxx_clkt_vps_init(void)
{
        struct clk_init_data init =3D { NULL };
        struct clk_hw_omap *hw =3D NULL;
        struct clk *clk;
        const char *parent_name =3D "mpu_ck";
        struct clk *reset_virt_prcm_set_ck;

        omap2xxx_clkt_vps_late_init();
        omap2xxx_clkt_vps_check_bootloader_rates();

        hw =3D kzalloc(sizeof(*hw), GFP_KERNEL);
        if (!hw)
                goto cleanup;
        init.name =3D "virt_prcm_set";
        init.ops =3D &virt_prcm_set_ops;
        init.parent_names =3D &parent_name;
        init.num_parents =3D 1;

        hw->hw.init =3D &init;

        clk =3D clk_register(NULL, &hw->hw);
        clkdev_create(clk, "cpufreq_ck", NULL);
        return;
cleanup:
        kfree(hw);
}

I added a call to get the =E2=80=9Cvirt_prcm_set=E2=80=9D clock and it =
came back null so the register does not seem to be working.  I thought =
this was a worthwhile problem to pose here in the event someone more =
familiar with this functionality knows the problem.

Regards,

Dave

