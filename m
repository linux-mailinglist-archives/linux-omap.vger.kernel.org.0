Return-Path: <linux-omap+bounces-4071-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39090AFBE06
	for <lists+linux-omap@lfdr.de>; Tue,  8 Jul 2025 00:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F9353AF8ED
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 22:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8885128A40D;
	Mon,  7 Jul 2025 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RrS1ehvT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7267944F
	for <linux-omap@vger.kernel.org>; Mon,  7 Jul 2025 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751925737; cv=none; b=Q2onZwHhB5kCs0tC5IUjzJKVo5BUjfDCGc+5Fcl6fr6qHq8yPeDuiL0g6VFTZC86KDDjG3Cq45B3+FG3XoWJN97nDTayA7kq646LvJ+00pjY4iOuu/d/OOSHvLGoa1wlhkqP7H8Usl/JXvm4BRq+qhB9hLpLLG9LRXJODpHhV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751925737; c=relaxed/simple;
	bh=cKXx6JymslCHND+f5QuBnv2v18DHm4d8srwU1qTCOxI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PKh0fB2bUqvSqhWnA8Y4TBG0t4HydDXwED51iTGp9fU2VokP8nXCR+WawwBOwSj3qwek/PoQoET49M+dCBzdKbCLLyTtkPrhZUaZzG/bweCfgR5eZjojozYCaPBDg+uEUzgDbapDVhXyXOxzDqXfYwq9/WhbI/UfwNT4YNLRzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RrS1ehvT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363616a1a6so34479185ad.3
        for <linux-omap@vger.kernel.org>; Mon, 07 Jul 2025 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751925734; x=1752530534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcJnW5Neag3kNc0gDLCz8lAjcbB+0TkmxgYu9PkzLAU=;
        b=RrS1ehvTlP4nbc79uB9wHv70W9mm9blGmeXHwSDzkHsPeGX9Rbfbamaspj6mMbR+TL
         acj0jr2AJZuyv4Ipj/wTWeWzPt8DDeuOTW1d+Eo+sb+GIcnFFILfAcDC8zohvEGadXtZ
         IyHY83mKVmrP7qAivfW22ArLNjDu8yVrD2Wgh6VX6ZlcsUaCFsMfk4HmIHsFtmJBpLR3
         TLRxACAljtaHy51Gyi0m2GtN1oKeKrQn02pDcMCud4sEKyQtzb3p/WfXH+QEoGOvFobT
         Ra7C7kjxrr1YmoldG+dpm+fcuesoKfGllDjTtTUVNh5Ie2R0YsZS0zhzMyj2RSJnRaO2
         jP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751925734; x=1752530534;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcJnW5Neag3kNc0gDLCz8lAjcbB+0TkmxgYu9PkzLAU=;
        b=Z1QXVFoqSNSO7UBLtCXJ0UOVbzmjvGm2izrQZf0eBnkoHwuUf1bOuzr7Z6SyF3nBdH
         tjklHebk3l++Fk4kC2lhMKLa5kObe/OPMpgF2nTis9xaOKbxgXgASeEJia4vuuVCzmge
         ilkOw9gF4e+ZppGUqGjQLovNqSnMATk4XbO4DyuymlYFcKJbc9aC1VbpbeoavT/tv8dc
         rYCie3xtT3n1/ouPTXqCghYWLb7Lv5adxWYvNGxfJ9ho8xTclbaBeXNqiUVtmkPblCoh
         ZrWYtpLD0uMmaIgKKrwBWkiEO6JgpahbHWgjjlMcVUgAaFC3NfQQfwJzIv9S9TxmWV+6
         6Vgw==
X-Forwarded-Encrypted: i=1; AJvYcCWexPahppswqpZjDYKTuhRFF4ok/0cv70IniNBAit7waL7ZKn0zuvCL+3HYahxgpnZWjFO7v0WGquFK@vger.kernel.org
X-Gm-Message-State: AOJu0YwCB+4XJouxd9ZfmNgJsjF6RHc5U+ThQlFAvQqUssXgB79H5Weh
	tMneZ8dxm7NR14DjROTq8rcdKeD7bhf/1y7At0YxlDyJo7OCzX5tlHSaw9c8i2khpuuUXYueMRg
	kyrQ6iRo=
X-Gm-Gg: ASbGncvx08djA3EZZCSjl9z4Sp4gYZDFT/TtcP5NlfjWJWhGCUgA/xwYnQCzW89SYfF
	fG5jAmaZ8sJyB0F5yQhmjobSSFNICMX39Jh0gpOwHA6A8qXxP8Hs3WZbh5EpX6VNaAUHpLKVziB
	2C/xqW0pe5a0GtXy6xAhQH2+ND3DUCM4HRuimBiwH5zN2BeqZSs+LzXXzkHnCty38b/PW8+fZfg
	HOWeeq1cn/L4ZBZCazNVH672jaoc+vDBvzyoADz47lm/MxWLQSq3uSr0xjyspBUkwMA7RW6TKbW
	qwlhu/1T1KuIndIv/MCWUhPqqR32ikxmpk2aZvCW9tp1+C6xGTlfqOJKHeTk
X-Google-Smtp-Source: AGHT+IEPJFsnaZIG819WSfMqCnxWmNxU3pek4gPQxsSTTWoojOjXxN+I6JSICSLu+gsjfM4o5intzQ==
X-Received: by 2002:a17:902:f789:b0:235:880:cf70 with SMTP id d9443c01a7336-23c8747607amr229518255ad.14.1751925734008;
        Mon, 07 Jul 2025 15:02:14 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845999e0sm93378725ad.202.2025.07.07.15.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:02:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, linux-omap@vger.kernel.org, Li Jun <lijun01@kylinos.cn>
In-Reply-To: <20250604081712.119523-1-lijun01@kylinos.cn>
References: <20250604081712.119523-1-lijun01@kylinos.cn>
Subject: Re: [PATCH] bus: del unnecessary init var
Message-Id: <175192573294.520018.9262103891935030460.b4-ty@baylibre.com>
Date: Mon, 07 Jul 2025 15:02:12 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Wed, 04 Jun 2025 16:17:12 +0800, Li Jun wrote:
> The compiler generates initialization instructions,
> which consume additional CPU cycles. the
> sysc_clockdomain_init should assign a value
> to 'error' before it is read.so the var don't need init
> to 0.
> 
> 
> [...]

Applied, thanks!

[1/1] bus: del unnecessary init var
      commit: 0711a8dcea2a928a54bfb40b064d6cab4b327edb

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


