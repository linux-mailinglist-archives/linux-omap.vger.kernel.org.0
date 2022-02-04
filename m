Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA34A9A1D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 14:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235873AbiBDNjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 08:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiBDNju (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Feb 2022 08:39:50 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A835C061714
        for <linux-omap@vger.kernel.org>; Fri,  4 Feb 2022 05:39:50 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d15so2620134wrb.9
        for <linux-omap@vger.kernel.org>; Fri, 04 Feb 2022 05:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=OtZSZjWaIhUQljFao2sjHwA6RTO0afdpQAlb8zKVzhc=;
        b=Q32RfdSa6LeBL9JP9ElOAhhEBm/LVlDwx+SRc+K3ucZaK/NJwS2tuyYbmvN9671hYm
         LjgwBKdEsehTbvnXjn9QFXcmtevk5b2LjrjQtDqQCOw9n5S4S8o+KS3o6J7wSLHqgP5P
         2eGGmBoVKqZOuf+Y16cJcZy2GYttoxV3Urfu0WVVslWzR1YF1haNvnbsRa54JYxVEVta
         1CuPP9p9zQZBkUnQeH+z2xGc7uDvdSxRxe7zl4duoWLg+6CCuYb0tzUv03viKvOc5igp
         OxBJczW3QgzyB/0Z2MW2b8AJdykZUyjDRo42p22Jkta6eHCw2ImQhyHvdW7PRZGYE4uf
         wPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=OtZSZjWaIhUQljFao2sjHwA6RTO0afdpQAlb8zKVzhc=;
        b=Z5+wOLEeTkuEC24FQFu9ZRrj8Wey3ZqSp3vltlW0/YWJtvNauzrucAqvrgt93eACge
         MiPoB56GVjuYQ+7wRZ2gBB1o1vMq+AvzYBygg/LW/MK8hqw+itaCzvR3mnaeqWASNvGu
         23y7qF0ptc5wIvOYbKSFCMCML/jdKqulnznhIRCe1uuHuf7beQMrDU8wndL/9LDhX6oa
         4sN0qYQJ9MzYl1P7brd23wQAEW3Ma+7sFFdBjDs9leHzqzkP+oRd/8wC0yRW+SUa0bde
         hvLR5zAAh2YOq53Jv2gdJJwG5f7UiUXKVMnKsoVAu4vNZ9c9ztQ4RBhsxfbtsUwU+nYa
         +rUg==
X-Gm-Message-State: AOAM532ioStSMhfjT3aVCJgnxn9jKfOQEDvYkUzJkdy9WPtbpwPKqPT+
        vSYcU/eYh+5s4pI61Fq9Ke6UcMAd9o3Yc59g
X-Google-Smtp-Source: ABdhPJzOdoi0zVSKf6kIjkRfihX1SQLpsCPRl9rLJmH0f4oke9d1OQ+zDmCP8vL+VMnTI8NnZc9Nvg==
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr2507085wrw.537.1643981988732;
        Fri, 04 Feb 2022 05:39:48 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id t4sm1877429wro.71.2022.02.04.05.39.48
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 05:39:48 -0800 (PST)
Message-ID: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
Date:   Fri, 4 Feb 2022 14:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     linux-omap@vger.kernel.org
From:   Romain Naour <romain.naour@smile.fr>
Subject: AM5749: tty serial 8250 omap driver crash
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I noticed a kernel crash while opening a serial port connected to a GPS device.
I initially reported the issue to the TI forum [1] but the issue seems related
to the 8250_omap driver.

Using the Linux kernel 4.19-rt provided by the TISDK 6.03, I was able to use a
GPS device connected to the uart4 of the AM5749 device (custom board).
As a basic test I'm using gpscat, gpsmon or gpsctl to open the /dev/gnss0 interface.

Note: The UART4 doesn't use RTS/CTS signals, Only Tx and Rx are defined in the
pinmux project (SW flow control).

Now I'm using a kernel v5.10.87-rt59 from the ti-linux branch [2] but I noticed
a kernel crash while opening /dev/gnss0:

__irq_svc from mem_serial_in+0x4/0x1c
mem_serial_in from omap8250_set_mctrl+0x38/0xa0
omap8250_set_mctrl from uart_update_mctrl+0x4c/0x58
uart_update_mctrl from uart_dtr_rts+0x60/0xa8
uart_dtr_rts from tty_port_block_til_ready+0xd0/0x2a8
tty_port_block_til_ready from uart_open+0x14/0x1c
uart_open from ttyport_open+0x64/0x148
ttyport_open from serdev_device_open+0x28/0xb0
serdev_device_open from gnss_serial_open+0x14/0x98
gnss_serial_open from gnss_open+0x68/0xb4
gnss_open from chrdev_open+0xa8/0x1a0
chrdev_open from do_dentry_open+0x110/0x3ec
do_dentry_open from path_openat+0xb64/0xd6c
path_openat from do_filp_open+0x80/0xf4
do_filp_open from do_sys_openat2+0x304/0x3d8
do_sys_openat2 from do_sys_open+0x7c/0xcc
do_sys_open from ret_fast_syscall+0x0/0x4c

It's not 100% reproducible but if you try 10 times the same command, the kernel
will crash.

It seems that the driver fail to read the UART_LCR register from
omap8250_set_mctrl():

"lcr = serial_in(up, UART_LCR);"

PC is at mem_serial_in+0x2c/0x30
LR is at omap8250_set_mctrl+0x48/0xb0

The problem only occurs with a -rt kernel, I tried with several kernel version:
5.10-rt, 5.15-rt and 5.17-rt.

I'm not able to reproduce the issue with a standard kernel.

While looking at the git history, I noticed this commit [3] about "flakey idling
of uarts and stop using swsup_sidle_act".

So I removed the SYSC_QUIRK for uart IP revision 0x50411e03 and it fixed my issue.

Before that, I tried to revert to SYSC_QUIRK_SWSUP_SIDLE_ACT but the kernel
crash again. Adding "ti,no-idle" to the ti,sysc node parent of uart4 doesn't
solve the issue either.

AFIU, the issue is related to auto suspend (smart-idle) present in uart IPs used
by TI in Sitara AM57xx cpu devices.

The problem is that the uart4 is in idle mode by default since it's not a serial
console.
 As soon as we use gpsmon on /dev/gnss0, the uart IP is switched to operational mode
.
The SYSC_QUIRK is reading the IP revision of the uart4 at address 0x4806E050.

Reading at this address with devmem2 while the gpsmon is not started trigger a
kernel oops:

devmem2 0x4806E050 w



To read this register correctly we have to start gpsmon first (opening /dev/gnss0).

Is the SYSC_QUIRK for omap4 still needed ? Is it safe to remove it ?
It seems this issue was introduced while dropping the legacy platform data
(between 4.19 and 5.4 kernels).

[1]
https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1074192/am5749-tty-serial-8250-omap-driver-crash
[2]
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=892cf512e34e60123e043f88bbb80
[3]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0d83aec6e0102e014eafdd453bdbc61b4d193029

Best regards,
Romain
