Return-Path: <linux-omap+bounces-1770-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5093191B
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jul 2024 19:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BE89B224B2
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jul 2024 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156E049654;
	Mon, 15 Jul 2024 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mG55TXvq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F4A44C7B
	for <linux-omap@vger.kernel.org>; Mon, 15 Jul 2024 17:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721063896; cv=none; b=GixbToFwSXZBKbI+Z53T5+OL+ri4IOYb/x3MK04cckFCt3XRFmeHYOMz2D0LXSOk87KJAQCUxOxbQdGycct4HiL8H3KkngckelQH1qMlfmlL2LG4WJ659vK0U1Aa3BPksmiHHhVrI+f72U+md+nTr2hPKieF7mns7CyZDVQafUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721063896; c=relaxed/simple;
	bh=sGPIgRMwOQgcxTqDzLkA2Xc8d8mFrxEg2vsRuPNY3Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bOZ0TgUhwm2Qk9ENn0BmdDW4M8AHBUylvEBuXPTZWYP4Q0D1zGneqXq/k3yvtHh69y86ywc+RwDh5PAbADfhQa1Ibw/8+iM8Xf+kNMXf6oy/7R5y+EX7UzCG494hVNAIrcw8A7sSxtrVMgIj8OHW1qjapL+1kaNz0rICV1koJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mG55TXvq; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-75cda3719efso2582144a12.3
        for <linux-omap@vger.kernel.org>; Mon, 15 Jul 2024 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721063893; x=1721668693; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YtGnG3lGdf/hkcfvEvKJE092rxHnVgPs69DM8LjlVo4=;
        b=mG55TXvq0O/N1NzBVF6Wns3pj4tXvxgTY1xZPstntxqv4zf99lndhHSHOuRKQ1TbhL
         1qPHRF0xhkFmexghKHz3xLaTk0TfAry2mtGSNsjCgrGfwarcaz+yWIK4z4gL6Wi73bcN
         ePWrw5u5yUwIyaf83qTLvimfW69RswXl7mJBYY0dYDvonJQUoWsfYOAI95Mwdushobg6
         MXP1QcmMblps8PPWQfdwa3mBm/U6W/KNgCzbH96hBPA2iDs72Iefqxr5yju+u3kxjToe
         gemFjQuh58pqMW2J26ztHNURQ5/q5cWgGVW2PLIt9D81oQyIQ3JyIDpGA6YO/1PRs2Mh
         DYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721063893; x=1721668693;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtGnG3lGdf/hkcfvEvKJE092rxHnVgPs69DM8LjlVo4=;
        b=bK94iKOYI6R4io7p4Dfbci76+Z/RkP77ThiVf4Wi/lKvMVZdmOlqeJDXwZlMiIebgE
         d2bnm9cngW+zdDtRiZ/f8UEU6R/sJEnWNjjvcmJ512vjfy7N/78FPRROUm2UVH37Ukms
         /ao5zfKUB/IhW3CaDcr+NOLdeqeHb6dA1ri8na+9P6T19+CqfXjf1AMVUUI7Ds1KxHRE
         tLcnUgasBRRyXnzCdb5XGdIMDQ2QvrDWihsSJ8Wyp3ZumRhgM0CJwrop+G0UHSITACbq
         NQCSxjmoyLbhrPFYWyhI8/R3TZF+lIVDLtJVnxAtE/Z/ZmZqVTKJp1bIo5gtrllSJqm8
         fySQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIZxFSyVXs0ZhZfWLWepZa4UkL33xF4fx93KZDRSkqKC+iqJRSFPPH5+W5T5nq7Ma7MW3DMP3oG9nZCXxEnDrbMOarJzb0CH60MQ==
X-Gm-Message-State: AOJu0Yz2S/704s6zxG3QK4SMDZ19HGOaf8aeme5YRz/FOkDpALEe7Lrb
	YCewDII2zH3kaI4koUBncB18MqsEAC1LGXlJpwzkmSYTUAAWF8DQpj1rcJHhcMo=
X-Google-Smtp-Source: AGHT+IFkOvHGd/UM3S2hiTAQyUuVpiY253uZl4jwquwLi7WE1eLM3bsAejx6xdhGzui9w1giQpsydw==
X-Received: by 2002:a05:6a20:9146:b0:1c0:f315:ec7e with SMTP id adf61e73a8af0-1c3ee98f09dmr622567637.28.1721063893162;
        Mon, 15 Jul 2024 10:18:13 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc516dasm43405355ad.288.2024.07.15.10.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:18:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: update omap branches for linux-next
Date: Mon, 15 Jul 2024 10:18:12 -0700
Message-ID: <7h5xt67ewb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Stephen,

I'll be taking over from Tony on maintaining the omap trees for
linux-next.

Could you please update the omap entries for the trees/branches pulled
into linux-next?  Patch below against next-20240715.

Thanks,
Kevin


diff --git a/Next/Trees b/Next/Trees
index 13308bb5322b..22b02f8c81ba 100644
--- a/Next/Trees
+++ b/Next/Trees
@@ -63,7 +63,7 @@ v4l-dvb-fixes	git	https://git.linuxtv.org/media_stage.git#fixes
 reset-fixes	git	https://git.pengutronix.de/git/pza/linux#reset/fixes
 mips-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git#mips-fixes
 at91-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git#at91-fixes
-omap-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git#fixes
+omap-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git#fixes
 kvm-fixes	git	git://git.kernel.org/pub/scm/virt/kvm/kvm.git#master
 kvms390-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git#master
 hwmon-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git#hwmon
@@ -134,7 +134,7 @@ drivers-memory	git	https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-me
 imx-mxs		git	git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git#for-next
 mediatek	git	git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git#for-next
 mvebu		git	git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git#for-next
-omap		git	git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git#for-next
+omap		git	git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git#for-next
 qcom		git	git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git#for-next
 renesas		git	git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git#next
 reset		git	https://git.pengutronix.de/git/pza/linux#reset/next

