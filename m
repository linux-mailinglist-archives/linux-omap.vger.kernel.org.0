Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D737A4709F5
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 20:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhLJTQi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 14:16:38 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43498 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234156AbhLJTQh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 14:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID
        :Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=KTWtqjgbbHxc6ApXIIzpZB2Pmo84JY4UXZM0el8M0xo=; b=UoScZ6XYxZX1BxefmqdwUJ6Vhn
        u9EwVoVkDaA1AtfU9nVPVp3rdi6rBhalDbpALh5lxOn8WnqrHGKRJJHLbYYHqotiMAq07jn8yjXFH
        mTyDL71XEPdWEhSvsWxeiruYdgtM2ZNxcPssonVYf2EZmzyv6kniriXnmjoCJ3sr5g1kgyH+k4L2w
        1BhkZ/0ndDPUYoKEKoy2E9DDuPw1evS05yx97s1o68nIPFExJyzHtexs1CWqfJHD8vSH1zpJrE+uj
        fleEivGRXPHzgs7/ILJJ+9mDYphWXH0wuUXEn8g7+gT6ZpaA/ZfYWHrCWPQWz9NgawPjNDiSufKWM
        Soofm9/w==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvlK6-0000gv-9v; Fri, 10 Dec 2021 19:12:50 +0000
To:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Nokia N900 increased power draw with panel-sony-acx565akm loaded v5.9
 and v5.10
Message-ID: <001a77db-80c0-d000-3d78-b9b301669826@wizzup.org>
Date:   Fri, 10 Dec 2021 20:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

I don't know if this is something that requires any action currently,
but I wanted to report that I'm seeing some increased power draw on a
Nokia N900 with minimal userspace on Linux 5.10 (and the same happens on
5.15 it seems, so it doesn't seem to be resolved since). I tried to
bisect the problem but my initial attempt failed, because the problem
seems a bit racy or unpredictable.

Basically I boot a system to init=/bin/bash and run the following:

> modprobe panel-sony-acx565akm
> 
> mount -t proc none /proc
> mount -t sysfs none /sys
> mount -t debugfs none /sys/kernel/debug
> mount -o rw,remount /
> 
> echo 1 > /sys/kernel/debug/pm_debug/enable_off_mode
> echo 0 > /sys/class/backlight/acx565akm/brightness
> 
> 
> consoles=$(find /sys/bus/platform/devices/4*.serial/ -name console)
> for console in ${consoles}; do
>     echo N > ${console}
> done
> 
> # Enable autosuspend
> uarts=$(find /sys/bus/platform/devices/4*.serial/power/ -type d)
> for uart in ${uarts}; do
>     echo 2000 > ${uart}/autosuspend_delay_ms
>     echo enabled > ${uart}/wakeup
>     echo auto > ${uart}/control
> done
> 
> # Configure wake-up from suspend
> uarts=$(find /sys/class/tty/tty[SO]*/power/ -type d)
> for uart in ${uarts}; do
>     echo enabled > ${uart}/wakeup
> done

This loads the panel and then sets the brightness to zero, enables off
mode and idles the kernel console/serial.

Then run the following to check idle states:

	grep ^core_pwrdm /sys/kernel/debug/pm_debug/count | cut -d',' -f2,3

And also check the power usage on lab power supply that I have here.

With the above, Linux v5.9 (no patches applied) idles at around 42mW
(15mW goes to the serial device, so it's more like 27mW, anyway...).

Linux v5.10 with the following two commits reverted (otherwise the
system is not stable):

* fb2c599f056640d289b2147fbe6d9eaee689f1b2 (ARM: omap3: enable off mode
automatically)
* 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 (mmc: Set
PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)

And the following config change on top of omap2plus_defconfig (to make
OFF mode work on v5.10 as detailed in "Nokia N900 not hitting OFF mode
since 5.9 is caused by proactive memory compaction"):

> sed -i 's/CONFIG_COMPACTION=y/CONFIG_COMPACTION=n/' .config

Idles at much more -- 60mW (compared to 42mW). Executing "rmmod
panel-sony-acx565akm" makes the power draw return to v5.9 levels.

I don't really understand why this would happen, and as stated before
wasn't able to really bisect the problem. However, some simple guesswork
led me to find that reverting 7c4bada12d320d8648ba3ede6f9b6f9e10f1126a
("drm/panel: sony-acx565akm: Fix race condition in probe") makes v5.10
idle at 42mW again. I don't know if this because v5.9 never properly
initialised the panel, or because the race condition fix introduced
another problem that leaves the hardware in an abnormal state.

Any hints on what could cause this extra power draw? Maybe the panel is
waiting for something? I suppose it's potentially feasible that with
more modules and userspace loaded the panel idles properly, but I
currently don't have a way to measure that.

Regards,
Merlijn


PS: For both v5.9 and v5.10 kernels the only other change to
omap2plus_defconfig is to make the watchdog(s) built-in.
