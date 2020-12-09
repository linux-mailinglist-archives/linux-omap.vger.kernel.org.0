Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095312D47BB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 18:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbgLIRTm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Dec 2020 12:19:42 -0500
Received: from sender11-of-o51.zoho.eu ([31.186.226.237]:21145 "EHLO
        sender11-of-o51.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730084AbgLIRTm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Dec 2020 12:19:42 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607534333; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=AjfbnPaSLmJX6wlXLvrs7qqal5Ku1xRQNoYsb/vMuuyK+A5EPSgjA6eCUwOlua4XbVdkXWQCnRNcCenYZ4BA33dN6LFIT1OIJaHEoWTR3FGpJl+3IMD0AqQ1uDlgOvy9qssLsAbL+Bggw+8m6Tg25dz+pHXYY0Lqxn0bhR8Sh4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1607534333; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=LvpNqcwKMWBIKGJrQ0krMhWjWOyYUek95h6ohA34EIs=; 
        b=lUXqKD2hV6Ynbjd3jUK8VnH9HVipWfYCjFMDskoM2sp9otZA7+8iALUJmbPcPbj0wnp0NAKM6/KCuV3nEK6UBfdloWycLnT4U2edMb06uL3EoerYfiZNlrIeAN20p1++2POY6eco9+1NA9iieK5tKF+8pNHktub/KySH6tzu6jY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-214-87.hsi15.unitymediagroup.de [95.222.214.87]) by mx.zoho.eu
        with SMTPS id 1607534332678791.4361525485727; Wed, 9 Dec 2020 18:18:52 +0100 (CET)
Date:   Wed, 9 Dec 2020 18:18:52 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     sre@kernel.org, tony@atomide.com
Cc:     linux-omap@vger.kernel.org
Subject: [BUG REPORT]  recording from plughw:CARD=Audio,DEV=2 on mapphones
 (cpcap audio) causes a nullpointer  dereference in kernel
Message-Id: <20201209181852.4c6574f951813a4ff302691f@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Recording from plughw:CARD=Audio,DEV=2, 40126000.mcbsp-dai1-mdm-call,
on mapphones (xt894, xt875) via eg. "arecord -D
plughw:CARD=Audio,DEV=2" causes causes a nullpointer dereference.

[  689.125366] 8<--- cut here ---
[  689.125366] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[  689.125488] pgd = 3c4022fd
[  689.125610] [00000000] *pgd=00000000
[  689.125732] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[  689.125732] Modules linked in: aes_arm_bs crypto_simd cryptd aes_arm aes_generic ccm usb_f_ecm u_ether usb_f_mass_storage libcomposite zram zsmalloc gnss_motmdm snd_soc_motmdm gnss qmi_wwan cdc_wdm usbnet option usb_wwan usbserial snd_soc_omap_hdmi wl12xx wlcore mac80211 libarc4 sha256_generic libsha256
 sha256_arm panel_dsi_cm cfg80211 joydev evdev mousedev pvrsrvkm_omap4_sgx540_120 omapdss omapdrm omapdss_base drm_kms_helper display_connector cfbfillrect
 syscopyarea cfbimgblt sysfillrect sysimgblt snd_soc_audio_graph_card fb_sys_fops ohci_platform cfbcopyarea pwm_vibra phy_generic phy_mapphone_mdm6600 ff_memless drm snd_soc_simple_card_utils omap2430 ohci_hcd touchscreen_buttons gpio_keys musb_hdrc cec cpufreq_dt ehci_hcd pwm_omap_dmtimer udc_core
 drm_panel_orientation_quirks led_bl omap_aes_driver omap4_keypad libaes matrix_keymap omap_sham usbcore omap_mailbox usb_common st_accel_spi st_sensors_spi
 st_accel_i2c st_sensors_i2c st_accel st_sensors ak8975 industrialio_triggered_buffer
[  689.125854]  kfifo_buf cpcap_battery cpcap_adc rtc_cpcap cpcap_pwrbutton cpcap_charger wlcore_sdio phy_omap_usb2 leds_cpcap omap_des snd_soc_cpcap libdes
 crypto_engine omap_crypto isl29028 snd_soc_omap_mcbsp industrialio snd_soc_ti_sdma snd_soc_core serdev_ngsm atmel_mxt_ts n_gsm leds_lm3532 led_class lm75 snd_pcm_dmaengine hwmon snd_pcm snd_timer omap_wdt snd watchdog soundcore
[  689.126037] CPU: 1 PID: 3776 Comm: arecord Tainted: G        W         5.9.0-g1a70dafe3dbb #19
[  689.126098] Hardware name: Generic OMAP4 (Flattened Device Tree)
[  689.126098] PC is at snd_dmaengine_pcm_set_config_from_dai_data+0x4/0x6c [snd_pcm_dmaengine]
[  689.126098] LR is at snd_dmaengine_pcm_prepare_slave_config+0x54/0x7c [snd_soc_core]
[  689.126098] pc : [<bf01b014>]    lr : [<bf1313c4>]    psr: 600d0013
[  689.126373] sp : e4c05ae8  ip : 00000001  fp : e8dacc00
[  689.126373] r10: e6bd9040  r9 : e4c05b7c  r8 : e8dacc00
[  689.126373] r7 : e4c05b00  r6 : 00000000  r5 : 00000000  r4 : e6be5e00
[  689.126403] r3 : 00000001  r2 : e4c05b00  r1 : 00000000  r0 : e6be5e00
[  689.126403] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  689.126403] Control: 10c5387d  Table: a2b0404a  DAC: 00000051
[  689.126434] Process arecord (pid: 3776, stack limit = 0x6ca7caf0)
[  689.126434] Stack: (0xe4c05ae8 to 0xe4c06000)
[  689.126464] 5ae0:                   e4c04000 e6be5e00 ea0ddf0c ec16cf00 e8dacc00 bf13147c
[  689.126464] 5b00: 00000002 00000000 00000000 00000002 00000000 00000000 00000000 00000000
[  689.126495] 5b20: 00000000 00000000 00000000 ac832ae9 ea0ddf0c e6be5e00 00000002 e6bd9628
[  689.126495] 5b40: e6be5e00 bf12af18 00000001 e6bd9040 e6be5e00 e8dacc00 00000001 e8c3d7c0
[  689.126525] 5b60: 00000000 e68ca4c4 00000002 bf12ca80 00000000 e4c04000 00000000 ac832ae9
[  689.126525] 5b80: 00000000 00000008 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126525] 5ba0: 00000000 00000004 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126556] 5bc0: 00000000 00000001 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126556] 5be0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126586] 5c00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126586] 5c20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126617] 5c40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126617] 5c60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126647] 5c80: 00000000 00000010 00000010 00000004 00000010 00000010 00000004 00000001
[  689.126647] 5ca0: 00000001 00000004 00001f40 00001f40 00000004 0001e848 0001e848 00000004
[  689.126678] 5cc0: 000003e8 000003e8 00000004 000007d0 000007d0 00000004 00000004 00000004
[  689.126678] 5ce0: 00000004 0007a120 0007a120 00000004 00000fa0 00000fa0 00000004 00001f40
[  689.126678] 5d00: 00001f40 00000004 00000000 00000000 00000004 00000000 00000000 00000000
[  689.126708] 5d20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126708] 5d40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126739] 5d60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126739] 5d80: 00000000 000fff07 008c0103 00000010 00001f40 00000001 00000000 00000000
[  689.126770] 5da0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  689.126770] 5dc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 ac832ae9
[  689.126800] 5de0: e8dacc00 e6be5e00 e8dacc00 e89fac00 e4c04000 00000001 bf093928 e4c04000
[  689.126800] 5e00: bf0969f8 bf089de0 a00d0013 bf08b0cc e4c04000 e89fac00 e8dacc00 bf08bbe4
[  689.126831] 5e20: a00d0013 00000000 ee8003c0 e8dac000 00102cc0 0000025c 00001000 00000000
[  689.126831] 5e40: e8dacc00 beb94a10 00000051 ac832ae9 0000025c e4c04000 e6be5e00 beb94a10
[  689.126861] 5e60: 00000000 e8dacc00 e4c2bec0 e4c55040 c0100080 bf08b0e4 c0195858 ac832ae9
[  689.126861] 5e80: 00000000 60000153 60000153 e2a30f04 60000153 e2a30f04 e2a30f04 00000000
[  689.126861] 5ea0: e4c04000 c0ae40f0 00000001 60000153 e2a30f04 c0195888 00000004 e4c05ec0
[  689.126892] 5ec0: 00000000 00000000 00000000 e4c05ecc e4c05ecc 00000001 e4c05ed4 ac832ae9
[  689.126892] 5ee0: 00000001 00000000 00000001 ac832ae9 b6e07d58 c25c4111 00000000 e4c2bec0
[  689.126922] 5f00: e4c04000 beb94a10 e4c2bec0 00000004 c0100080 c034be20 00000051 c06df5e4
[  689.126922] 5f20: 00000001 ac832ae9 00000000 e6bfed80 00000001 00000001 b6e07d57 e4c05f78
[  689.126953] 5f40: e4c04000 00000000 00000000 c0335608 00000142 c0331a14 00000000 00000000
[  689.126953] 5f60: e3cbeec0 e3cbeec0 e4c04000 00000001 b6e07d57 c03357f4 0040d602 ac832ae9
[  689.126983] 5f80: 0040d602 0043fdc8 beb94a10 00441a00 00000036 c0100244 e4c04000 00000036
[  689.126983] 5fa0: 00000000 c0100080 0043fdc8 beb94a10 00000004 c25c4111 beb94a10 0002000f
[  689.127014] 5fc0: 0043fdc8 beb94a10 00441a00 00000036 beb94900 00425d18 00413058 00000000
[  689.127014] 5fe0: b6f66840 beb948d4 b6f02469 b6da5f08 200d0030 00000004 00000000 00000000
[  689.127014] [<bf01b014>] (snd_dmaengine_pcm_set_config_from_dai_data [snd_pcm_dmaengine]) from [<bf1313c4>] (snd_dmaengine_pcm_prepare_slave_config+0x54/0x7c [snd_soc_core])
[  689.127532] [<bf1313c4>] (snd_dmaengine_pcm_prepare_slave_config [snd_soc_core]) from [<bf13147c>] (dmaengine_pcm_hw_params+0x6c/0xc8 [snd_soc_core])
[  689.127838] [<bf13147c>] (dmaengine_pcm_hw_params [snd_soc_core]) from [<bf12af18>] (snd_soc_pcm_component_hw_params+0x44/0xb4 [snd_soc_core])
[  689.127838] [<bf12af18>] (snd_soc_pcm_component_hw_params [snd_soc_core]) from [<bf12ca80>] (soc_pcm_hw_params+0x478/0x628 [snd_soc_core])
[  689.128143] [<bf12ca80>] (soc_pcm_hw_params [snd_soc_core]) from [<bf089de0>] (snd_pcm_hw_params+0x350/0x834 [snd_pcm])
[  689.128143] [<bf089de0>] (snd_pcm_hw_params [snd_pcm]) from [<bf08b0e4>] (snd_pcm_ioctl+0x264/0x191c [snd_pcm])
[  689.128540] [<bf08b0e4>] (snd_pcm_ioctl [snd_pcm]) from [<c034be20>] (sys_ioctl+0x12c/0xc0c)
[  689.128631] [<c034be20>] (sys_ioctl) from [<c0100080>] (ret_fast_syscall+0x0/0x28)
[  689.128631] Exception stack(0xe4c05fa8 to 0xe4c05ff0)
[  689.128662] 5fa0:                   0043fdc8 beb94a10 00000004 c25c4111 beb94a10 0002000f
[  689.128662] 5fc0: 0043fdc8 beb94a10 00441a00 00000036 beb94900 00425d18 00413058 00000000
[  689.128692] 5fe0: b6f66840 beb948d4 b6f02469 b6da5f08
[  689.128692] Code: e5933120 e5930000 e12fff1e e5903030 (e5910000) 
[  689.128845] ---[ end trace 3837e84c7ee91b12 ]---

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
