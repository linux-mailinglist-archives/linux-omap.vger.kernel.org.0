Return-Path: <linux-omap+bounces-4587-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E3B46695
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8811CC17BD
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8EE28BA81;
	Fri,  5 Sep 2025 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nrISYqPr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE402877C5
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110936; cv=none; b=FqITP5jhPqMxLtw9G/52c1bVo7rnidTDv6/9ad0DMzTTlbfUAFgy+7u3K4ExjIHmN6yLDrsWLdOlIaYlS580/5q/8lysHBdAr5uxTiMOMSQ8SYCiSC0AJKUdjaezpuSb4hZxyfSV+MNqvSUw90Hlxvn9vtdjY4Q2sqS6qHTmRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110936; c=relaxed/simple;
	bh=UmsbtvpHH6dCcRh9PQWjM+jHBvHIoXmODBTqt1yUgbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UZ6rFtk/VdluB0UbNyqb9rU0ZTwvv0/+QvaktUcz2H15JllBpSNdrq//grp3qTHkr3DkAdbp0Ml48hkfrqRirbHcxcEgIycBC7VM1/wTTUSSOFSobSDl/khr73CzRTmF9mwbRhcxPo3NilCgFElkGopN4Jy+Ip+h+zvqKKjKPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nrISYqPr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24457f581aeso25525295ad.0
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110934; x=1757715734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiYUmwan2a+kfrxXxMqe+npus8z9DGrn+GKVxPMVh9I=;
        b=nrISYqPrA+XTY9E7XCeAHfODiPoxRfYwZGfe6CF3OqHehe0EV/dgstewS3zwtGAfha
         kn8TghXWfIH97vJ7HEcpQr0p2kvTH+2B6oWxBIHTBvAob8BNVNM+LAbmw9mT4z2DkAnl
         vnsvrx3tdLwxE0scBobAEj2ejA1UKWv8bXrUBTxq+ll+kbijiOa4LSM/Pve2Cct+/Kjt
         2fkeAjJ3fAwlYISNeZHBJaN1949xrqcvC7TrFs/vpjVXJ4aeziCjUybz6nJtt04cPhtp
         6syWh4UjCO3qZM4a9fUpiI8PQ4aeET9dJD49fbuno27hIp82dWDMdJ+zRCvtaFfJjWbV
         VsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110934; x=1757715734;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiYUmwan2a+kfrxXxMqe+npus8z9DGrn+GKVxPMVh9I=;
        b=U8KOLvywHO8muK4zM/4aaBkjfx1ADF/kMmQFrQXj+FdE7ePEz0V65+q8lYMIwLpJnR
         8sYPf5y3/jORG7316XA/1jK6NzeVpacnMCKrRdKt6VXKU0DRyeC7ACwor/Bx8ECFUkUX
         cOgNHJ5K4TzhQC7NC0DpnOt/oVJ5Tg4Vs1YyERxApcDxvcuzT36YaF20VVJa2Wd2RZxO
         41BLJ3UwL3TRg4RPV5rrXT094IRTxJjYBcV4roX6jY8zqkBX1J4JjHj1h71uCdFTOti9
         ew9qjEhKJxxl4b91N/6PfIwRU6o6/HBeFUqWbyzX4aHcLNggSVGsLMsBPrN6Kb44k3cT
         ryJQ==
X-Gm-Message-State: AOJu0Yx1Dny2ok0fgXZLrHilJrQMAqvs/EzRZmfKHKdIcbwfBazGd7W3
	HqcD2FMkloqfmG5Tl6pCeAP0qVHYeP1KiJTx2P9o7nK6cm/xQ9RH1fTuBiAY8WBoB2w=
X-Gm-Gg: ASbGnctZDOtms5IQ9v5T16lT73xeX/4KcItR0RI4DUgbSFnzBpeGHD7bsE1n3/uJ5Nl
	kqvxqlGJRCV26/j5s+ioBdY6tKaAPL0C60nb2G+4mtLHlyM2V9IWkPX/4odda4L7lKv0gbEHFLg
	vo2M8ZUZuJGdfV2l865v+eQBMnS0lUjvqCEV6XmFMTOvKv4m983HXvWXY1UUc0DIUXCDXuGi2SZ
	uJgdnO29Xn34xrGj4kK0wBfVWbL+DQlWZyvTGkFvYZIgeBGZK9/K2+HJofzLfey77a7PDjao1PO
	w1vJi6ZqlCAWX3KfJY7Dyd1+AifTW9aPndcBbH8yLBrGqYUgHM9074nkldmpCy9SN9JYsPkUGsX
	sTi7B5BE2yMZo2MuYfWoCCj4BL6o3cME=
X-Google-Smtp-Source: AGHT+IGHJWZuIgRAyT9zDVhr8nN6RGJKLHHQvXkQ2g6HD6wb1cHUQurMIYZhLi1IBI4WggIZ+0i/Gw==
X-Received: by 2002:a17:902:a5c3:b0:24c:e9b8:c07 with SMTP id d9443c01a7336-25174374060mr2170575ad.43.1757110933953;
        Fri, 05 Sep 2025 15:22:13 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1ba1718bsm103698335ad.39.2025.09.05.15.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, Yang Xiuwei <yangxiuwei2025@163.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Yang Xiuwei <yangxiuwei@kylinos.cn>
In-Reply-To: <20250817083449.2249268-1-yangxiuwei2025@163.com>
References: <20250817083449.2249268-1-yangxiuwei2025@163.com>
Subject: Re: [PATCH] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
Message-Id: <175711093307.666031.7544773009023816119.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:13 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Sun, 17 Aug 2025 16:34:49 +0800, Yang Xiuwei wrote:
> Simplify error handling in OMAP powerdomain, voltage, and VP code by
> replacing open-coded '!ptr || IS_ERR(ptr)' checks with the combined
> IS_ERR_OR_NULL() helper.
> 
> This improves readability and consistency across
> omap_set_pwrdm_state(), voltdm_get_voltage(), voltdm_scale(),
> voltdm_reset(), and related functions.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
      commit: 045e81d8d7e65baefbd4dea0503ca3330f93f3e6

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


