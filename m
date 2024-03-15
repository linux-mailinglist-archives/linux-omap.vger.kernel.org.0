Return-Path: <linux-omap+bounces-895-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A442887D720
	for <lists+linux-omap@lfdr.de>; Sat, 16 Mar 2024 00:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130B21F227DB
	for <lists+linux-omap@lfdr.de>; Fri, 15 Mar 2024 23:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0791E54901;
	Fri, 15 Mar 2024 23:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8aAxqrS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5726101E6
	for <linux-omap@vger.kernel.org>; Fri, 15 Mar 2024 23:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710543877; cv=none; b=kCQOrDBygvvTKiO4LH8UEtCPjBzd1rMancgmvFtHOznntmWyK+DJQCR+thmWadMTN42pPWpL78INCc7LsR3sMDAldEk5nfwth1phiHfH3pYg1qCLXLWF0b5YQ/vP548PHL2/5Njr/q9Tl8mIPNMHy0SVra3WXKBXYFih04q1D8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710543877; c=relaxed/simple;
	bh=hLeJP97ULyJvWGhtpLLZ9Rf8paA6bhU/UR1X8AzZMGc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uHoWfBourysyMrpljw9xnQiKxdC1VRQK8Y8ip5LD4VoEdpDrufd9X8MUtBByfQpFYri1kfL5O+4FDosH6LlQzQHnuPPwtgXjfxarC64Fl5MAWMB39pNGEh3mRlNbcHXWfgjOYn+x+cZYTNqHQf2amk7AoT4kvSItQqizkwILs2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8aAxqrS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-413ffe7ee4eso9897795e9.2
        for <linux-omap@vger.kernel.org>; Fri, 15 Mar 2024 16:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710543874; x=1711148674; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MNMSXndo1fCxwzBEQ2N9j4v97hubsKJyL8zdqmaJSf8=;
        b=J8aAxqrSj9wJJUaJy7KIuJvx2stcymT4g9dHlRFn7wQZp1iQU20gVd1djQIHg4OyVU
         K38obat2s+dga2mo7JN6S9wjKcZ3CwYojESJ33+MEer1om2qgAut1iDeDs/CLI8YzwBm
         UcJL7GJcQpdOmZjN4dhMFWnEjue3tr1i4gTHHkg+3t3qsk886lQ1BA1zuDnndSVcr7w6
         KB36HdxfoOQhHCFAX4+alRZ69w5X7+VLYwZRpVH/rkAPDvYJ24PAaUcs0AajGSuMSQI8
         0t0Yrv8tZRFARcLbMwKUI/v67JMUHW17mSnvIhBYM84b/238LmvtQxU4Nsv/JROeEgUn
         6V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710543874; x=1711148674;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNMSXndo1fCxwzBEQ2N9j4v97hubsKJyL8zdqmaJSf8=;
        b=qiuf9E4yDGQOmDlsH5dqUw6+kjvEbhSeRyqQZt3HRADnKf6yWwdik/XcGHcThaU6DG
         UhUpFjZyrGRR2wYbhWEEEpZlYWY/gaP+WWAgdV2Mddl8Ed8/5QVOSYGWQXvTkgYMr9Ew
         lNfeDPKITJ3aVLRo5+3hFfBN6DGtWVXqjZyRmlDObW1HAYZc+mpV8FDzbUC+O06kN1XR
         fH9CaQq5e1bEu7VhDjbufps4bd1UOJdXN+pMnwgwmuPuaKMcJkIctfHjkb3n2RMfjS4k
         lHuAz/PN+BIw7mNXI2vrEroRER6ZaXc2CLKyC6OR7Ca3UNg1r1XW7pHStCk8wq+5I7l+
         EAZw==
X-Gm-Message-State: AOJu0YyZ4SssL9LeRJW2Nw7jki76ikdMikrzsGr6vJ8P2ccXLUaHQ51Z
	CprgCVec2s4qwkBTGNTKjhbTApEmIrUSgfFy2+N6N+xbE10pZRtGklii6JE0Dj7SLH16nzctIw5
	U0XEOZMq5TKZdo7QNGmAGZWYPUcn/beA7AYI=
X-Google-Smtp-Source: AGHT+IHVZx5RfFhALnj0yht2c4Q3dNTH7VJjbPaXLUGY0UQITktVVd8zSwgtKsdYNjDENubgP4S2kk0HAtv+5LonnXg=
X-Received: by 2002:a05:600c:1d81:b0:413:fff2:a868 with SMTP id
 p1-20020a05600c1d8100b00413fff2a868mr2616688wms.29.1710543873391; Fri, 15 Mar
 2024 16:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jeremy Mattfeld <jmmattfeld@gmail.com>
Date: Fri, 15 Mar 2024 16:04:22 -0700
Message-ID: <CABbzQ=fqmBeq_9YLjWq_8Lf=1E1L0igMxHUKcHr6hohyYnvvkQ@mail.gmail.com>
Subject: sdhci-omap signal contention
To: linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am developing a custom am335x platform using eMMC for the rootfds
that also reads several ADI adc's via the IIO subsystem.
Unfortunately, in order to get the device to boot from the eMMC, I had
to short the signal for DAT0 to the eMMC to a pin I also use with the
gpio-mux driver to select the spi slave adc that I want to talk to.

I have no specific requirements to read/write on the eMMC while
performing I/O on the spi but I still get sdhci errors errors while
using the mux drivers when I want to talk to the adc's.  I am hoping
there is some kind of software workaround for this problem.

I am using an EXT4 filesystem for my rootfs on the eMMC.  I have also
tried using a read-only rootfs.  I also created a patch for the
gpio-mux driver that sets the pins to input when the mux is not
selected hoping to simulate a tri-state configuration.  None of these
efforts have solved my problem. Below is the output from the sdhci
driver when the error occurs.  Any suggestions would be appreciated.

root@dsa5000-021:~# [ 1035.360798] mmc1: Timeout waiting for hardware interrupt.
[ 1035.360825] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 1035.360830] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 1035.360844] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000001
[ 1035.360850] mmc1: sdhci: Argument:  0x00000000 | Trn mode: 0x00000013
[ 1035.360856] mmc1: sdhci: Present:   0x01f70a06 | Host ctl: 0x00000000
[ 1035.360862] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 1035.360868] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 1035.360873] mmc1: sdhci: Timeout:   0x0000000c | Int stat: 0x00000000
[ 1035.360879] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 1035.360885] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 1035.360890] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 1035.360896] mmc1: sdhci: Cmd:       0x0000083a | Max curr: 0x00000000
[ 1035.360901] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x3403032a
[ 1035.360907] mmc1: sdhci: Resp[2]:   0x36353730 | Resp[3]:  0x7001004d
[ 1035.360913] mmc1: sdhci: Host ctl2: 0x00000000
[ 1035.360918] mmc1: sdhci: ============================================
[ 1035.421369] mmc1: switch to bus width 8 failed
root@dsa5000-021:~# [ 1299.680032] mmc1: Timeout waiting for hardware interrupt.
[ 1299.680059] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 1299.680065] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 1299.680077] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000008
[ 1299.680084] mmc1: sdhci: Argument:  0x00041fe8 | Trn mode: 0x00000023
[ 1299.680089] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000000
[ 1299.680096] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 1299.680101] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 1299.680107] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 1299.680112] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 1299.680118] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 1299.680124] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 1299.680130] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 1299.680135] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
[ 1299.680141] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 1299.680146] mmc1: sdhci: Host ctl2: 0x00000000
[ 1299.680151] mmc1: sdhci: ============================================
[ 1309.919983] mmc1: Timeout waiting for hardware interrupt.
[ 1309.920010] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 1309.920042] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 1309.920056] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000008
[ 1309.920062] mmc1: sdhci: Argument:  0x00041fe8 | Trn mode: 0x00000023
[ 1309.920068] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000000
[ 1309.920074] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 1309.920080] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 1309.920085] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 1309.920090] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 1309.920096] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 1309.920102] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 1309.920108] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 1309.920114] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x3403032a
[ 1309.920120] mmc1: sdhci: Resp[2]:   0x36353730 | Resp[3]:  0x7001004d
[ 1309.920126] mmc1: sdhci: Host ctl2: 0x00000000
[ 1309.920130] mmc1: sdhci: ============================================
[ 1310.023058] I/O error, dev mmcblk1, sector 265184 op 0x1:(WRITE)
flags 0x103000 phys_seg 1 prio class 2
[ 1310.023136] Buffer I/O error on dev mmcblk1p2, logical block 124,
lost async page write
[ 1319.145773] EXT4-fs error (device mmcblk1p2):
ext4_check_bdev_write_error:217: comm systemd-timesyn: Error while
async write back metadata
[ 1320.159965] mmc1: Timeout waiting for hardware interrupt.
[ 1320.159992] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 1320.159998] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 1320.160011] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000008
[ 1320.160017] mmc1: sdhci: Argument:  0x00041fe8 | Trn mode: 0x00000023
[ 1320.160023] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000000
[ 1320.160029] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 1320.160034] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 1320.160068] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 1320.160075] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 1320.160080] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 1320.160086] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 1320.160092] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 1320.160098] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
[ 1320.160103] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 1320.160108] mmc1: sdhci: Host ctl2: 0x00000000
[ 1320.160113] mmc1: sdhci: ============================================
[ 1320.212742] I/O error, dev mmcblk1, sector 270312 op 0x1:(WRITE)
flags 0x103000 phys_seg 1 prio class 2
[ 1320.212775] Buffer I/O error on dev mmcblk1p2, logical block 765,
lost async page write
[ 1325.421342] mmc1: switch to bus width 8 failed
[ 1335.519934] mmc1: Timeout waiting for hardware interrupt.
[ 1335.519959] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 1335.519965] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 1335.519978] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000018
[ 1335.519984] mmc1: sdhci: Argument:  0x000c0ea8 | Trn mode: 0x00000023
[ 1335.519990] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000002
[ 1335.519996] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 1335.520002] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 1335.520008] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 1335.520014] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 1335.520019] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 1335.520024] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 1335.520030] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 1335.520037] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
[ 1335.520042] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 1335.520047] mmc1: sdhci: Host ctl2: 0x00000000
[ 1335.520052] mmc1: sdhci: ============================================
[ 1345.759923] mmc1: Timeout waiting for hardware interrupt.
[ 1345.759950] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 1345.759955] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 1345.759968] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000018
[ 1345.759975] mmc1: sdhci: Argument:  0x000c0ea8 | Trn mode: 0x00000023
[ 1345.759981] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000002
[ 1345.759987] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 1345.759992] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 1345.759998] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 1345.760004] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 1345.760009] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 1345.760015] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 1345.760021] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 1345.760026] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
[ 1345.760032] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 1345.760037] mmc1: sdhci: Host ctl2: 0x00000000
[ 1345.760042] mmc1: sdhci: ============================================
[ 1345.812811] I/O error, dev mmcblk1, sector 790184 op 0x1:(WRITE)
flags 0x800 phys_seg 3 prio class 2
[ 1345.812919] Aborting journal on device mmcblk1p2-8.
root@dsa5000-021:~#
[ 1389.145664] EXT4-fs error (device mmcblk1p2):
ext4_journal_check_start:83: comm systemd-timesyn: Detected aborted
journal
[ 1389.278756] EXT4-fs (mmcblk1p2): Remounting filesystem read-only


After the filesystem was remounted, there were no more errors.
Although it took longer on a different module it eventually failed in
the same fashion:
root@dsa5000-020:~# [ 2132.303563] mmc1: switch to bus width 8 failed
[ 2167.663775] mmc1: switch to bus width 8 failed
[ 2352.482705] mmc1: Timeout waiting for hardware interrupt.
[ 2352.482732] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 2352.482737] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 2352.482751] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000008
[ 2352.482757] mmc1: sdhci: Argument:  0x00041fe8 | Trn mode: 0x00000023
[ 2352.482762] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000000
[ 2352.482768] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 2352.482774] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 2352.482780] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 2352.482786] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 2352.482791] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 2352.482796] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 2352.482802] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 2352.482808] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x00000000
[ 2352.482814] mmc1: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[ 2352.482819] mmc1: sdhci: Host ctl2: 0x00000000
[ 2352.482824] mmc1: sdhci: ============================================
[ 2387.682736] mmc1: Timeout waiting for hardware interrupt.
[ 2387.682763] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 2387.682768] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 2387.682781] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000010
[ 2387.682787] mmc1: sdhci: Argument:  0x000c0f20 | Trn mode: 0x00000023
[ 2387.682793] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000000
[ 2387.682799] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 2387.682805] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 2387.682810] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 2387.682816] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 2387.682822] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 2387.682827] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 2387.682833] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 2387.682839] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x340302ab
[ 2387.682846] mmc1: sdhci: Resp[2]:   0x36353730 | Resp[3]:  0x7001004d
[ 2387.682851] mmc1: sdhci: Host ctl2: 0x00000000
[ 2387.682855] mmc1: sdhci: ============================================
[ 2387.893192] I/O error, dev mmcblk1, sector 790304 op 0x1:(WRITE)
flags 0x800 phys_seg 2 prio class 2
[ 2387.893301] Aborting journal on device mmcblk1p2-8.
[ 2441.830811] EXT4-fs error (device mmcblk1p2):
ext4_journal_check_start:83: comm systemd-timesyn: Detected aborted
journal
[ 2452.322819] mmc1: Timeout waiting for hardware interrupt.
[ 2452.322847] mmc1: sdhci: ============ SDHCI REGISTER DUMP ===========
[ 2452.322852] mmc1: sdhci: Sys addr:  0x00000000 | Version:  0x00003101
[ 2452.322866] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000008
[ 2452.322872] mmc1: sdhci: Argument:  0x00040800 | Trn mode: 0x00000023
[ 2452.322878] mmc1: sdhci: Present:   0x01f70506 | Host ctl: 0x00000000
[ 2452.322884] mmc1: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[ 2452.322889] mmc1: sdhci: Wake-up:   0x00000000 | Clock:    0x00000087
[ 2452.322925] mmc1: sdhci: Timeout:   0x0000000e | Int stat: 0x00000000
[ 2452.322931] mmc1: sdhci: Int enab:  0x027f000b | Sig enab: 0x027f000b
[ 2452.322937] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[ 2452.322943] mmc1: sdhci: Caps:      0x07e10080 | Caps_1:   0x00000000
[ 2452.322949] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00000000
[ 2452.322955] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x340302ab
[ 2452.322961] mmc1: sdhci: Resp[2]:   0x36353730 | Resp[3]:  0x7001004d
[ 2452.322966] mmc1: sdhci: Host ctl2: 0x00000000
[ 2452.322971] mmc1: sdhci: ============================================
[ 2452.430066] EXT4-fs (mmcblk1p2): Remounting filesystem read-only

