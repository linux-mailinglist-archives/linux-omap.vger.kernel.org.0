Return-Path: <linux-omap+bounces-4925-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF81C6587C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 18:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 019E54F4785
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 17:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D219309EE4;
	Mon, 17 Nov 2025 17:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IapA3aa3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529D307481
	for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 17:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400578; cv=none; b=BNbI6Qpm63iZzlPKtmiPedMzgg3oRXXjbQRJ/60WNpT7jt86h/DiKdzIweW5jiOTDs+J/McbHWsYbR4P391g1rz2ew3TEHQdQsK+53g3XocJnElCEFt6kuvFsxgMXFJ5dViM7H1Uc/YXeZgux3XrrOCZVCEet4U3ZV9HXaJYjXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400578; c=relaxed/simple;
	bh=eOWVoBy6VqXtHjNgx4XgUnlNbU1DJtIXlJJOYQmQGHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j5jTw0VvWNaBd4ElRZcbGtz0aBZ8ljDsCFME5j2s2/iZWq1ZREzwwwAAZcvEynQJIV3duePfagVsHH6R26pNwCTN3Uk12el5Pcf3NKIP5P7Aij71IVX6KMgM4HIZM9yqg01GwxpCR5dtGW74iv4Va8BKwv6ro1QNuNL+RyLEWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IapA3aa3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29555415c5fso52632355ad.1
        for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400576; x=1764005376; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=;
        b=IapA3aa3RGWsr6FrkpuoFSlSmxmpXxWRf75h8etYshvRUPc9FX9jRMAz9IuI5B9gWy
         nH5C0E3S3p3EWlUpivFAXoxuMFt4LXJatA9OC0sGqs18vnO3Q6wAqZfPX+V44+fmzka2
         mHzDAr5Sl20uc0aHO9ahMf9eB89H6YroqfmbDuIvWovkRKubh7Cj9MNYrmB7DES2uBDb
         TxYmiRUE6KuOvprkHPs4FuwMPtFzPfLlwPRs0wcxdB0/XyE3Idbtdq+kA1AIXyyw6iB7
         wZzLkGk/Qcdk/43fif/38YFkScF66TRmlIukyMDCo3QB/To4JwtYTYS5RKUmvnfTWw+/
         oYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400576; x=1764005376;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hR9EM2z6sHnGhlsEZZ88mJGrfMpYr2YCoYJvLqYoDdQ=;
        b=PJ5WAqG7VLctJ3pppm1nwmI04nq6XaOP161nesWlEPtYnKUfcwtUJ+qJE16zGZ2hVU
         aveR0g3AfTP/ylyXOpCz/YCifkjD5vnca5miAwrVI5XSjhu+qiOmijbNH+bvbVSIg8CN
         LJNXxfelfABtdOt8QS5ao95OIslCjxhSCEQoFvKRuu6Wc0Jxyy9V1EOxT++uFQEUR+8o
         HMZamaESJB1UYM7hYe06dcayR6wAlircjYqeSWPHgxSiP+fVhSqhULQAcfzM8STAIU8+
         9Lv5Yl5wHdJ4KbwZtWSFk9PkflbV5eAF20X2QdH6BlFI7BR1I/uXSWsvG5iETCS5AidZ
         KhNg==
X-Gm-Message-State: AOJu0YzjsVegSUj03I84GIfpgv9kSOCytA6PQwZj+5nHJoKADsrLxkEj
	Nldw/KN8YPstetyFdWKB7gu9dRGT2j3HL5ub7XURmMm5/Jh3i69TDe1Y6Ys5IsMGBjUIOgNaapQ
	rzVrgJA8=
X-Gm-Gg: ASbGncttOP9rzqTCW5xhslwjNEAPnjRTVyjbo+C/aw2LWFInualU8dqm9wl9A8lBsvT
	XHlce1PjoIiN9LpXCG7zyzb68SSLj1v1M7yWhZqjyUIcPu6JR7tbTjiPYk/QPzv1NxKq0gapg5B
	FujRjG6RxXDDxKi0hFhXJ5faWrE6UpZHShZa+RCTU8mClDFabd0JvzZBPV4gX5NCDzKEDVkJdCn
	r05iVkNfDUMbc+mGZ96x/qScIF+A4WkOfc9zXWZrM3urk/UL0WmQhQ2E9vVDts1W1JkC9MEa+5n
	PyE6C66rg9vjqlrLkAxmmD9OhlE/4dy++VguS+jGcMLofqyLDpTBgbPhH4Wl2cLB7/WafOYgv5C
	F4CI9eIhyaq+Gxp6XDh9Gn9Ho3bGXV248vFPCLnrgjraFieU+tLr32y8u2BlpXmLgNWjbQ4TcIQ
	==
X-Google-Smtp-Source: AGHT+IF9V/dBvlwYAdM9IAYen85Y0K9dLfQidM8wPheh0H+XYjGDt3ZMEs/v4nT38ZUHffpu7c/I9Q==
X-Received: by 2002:a17:902:dacb:b0:298:33c9:ed99 with SMTP id d9443c01a7336-2986a7414e3mr169566815ad.30.1763400575878;
        Mon, 17 Nov 2025 09:29:35 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed23sm146031965ad.87.2025.11.17.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:29:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/defconfig: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:29:35 -0800
Message-ID: <7hv7j8k1og.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/defconfig-signed

for you to fetch changes up to 393f40ef96628f603b40e97b6da9847d20a904c0:

  ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver (2025-11-17 08:53:20 -0800)

----------------------------------------------------------------
multi_v7_defconfig: Enable TI PRU Ethernet driver

----------------------------------------------------------------
Parvathi Pudi (1):
      ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

