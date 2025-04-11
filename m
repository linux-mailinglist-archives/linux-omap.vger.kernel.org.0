Return-Path: <linux-omap+bounces-3578-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE39A850B6
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 02:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3ACB4C1D7E
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 00:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DBE1B7F4;
	Fri, 11 Apr 2025 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U6F3HDwt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D840DDC3
	for <linux-omap@vger.kernel.org>; Fri, 11 Apr 2025 00:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332083; cv=none; b=QMFCK/fWLkCodhUNkVDJY3Bzc96qwpAN2pYUCI9pHGCNW/nnTh6mb9hdrwTkVnf7ep1C504DE8wWce4BoFUMmntNekXojZLx7Eqmq/EiJdykzhzg/8D2ZjT+16jO02QyDFeKZ5FdzD786NZUArBO9AVQHmbDJ2sV1qGoWN5goyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332083; c=relaxed/simple;
	bh=1r1LHmJ+FP1QHwOwOrhftk8RpNrpsI8w5sTLVW80UhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JtTn1YCvLicD5Og1Bc3YVwEqjbFkfH8GPyH8nGjguC0QJzj8qoluoY5i9daSIcXvLnA8omhFnLtbQVJSev7RIxSE5mtQKfHBR5E7TqASmpmDhKXlxcn2QZM2wLuIyyshQmcClq+XKQOw4H1v7xcUBBmbJHZft0VPwI63PB7eDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U6F3HDwt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22928d629faso14745415ad.3
        for <linux-omap@vger.kernel.org>; Thu, 10 Apr 2025 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744332081; x=1744936881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/4rHMPP0tffZ6aLtmo/OkH8XS8Fu3axD96DxnaYzNo=;
        b=U6F3HDwtzPTj+nzsOMh1ZiHxU0zQaKETkoaiMI7cwLjpLmOJztyMyBKkymPijMAJPr
         SNE95bkET+fPAlsExTfLcykdtL/9+AouqlHsZbkN4I9kbOTULuQEqJpsJ7gWwXzanJmo
         gfWWUnXOeNBbDJqzykRt+846ntDiSH1q8Y+NlaVXw8CiWMQPPykqPmKhQ3Mxi+PYCFEM
         nKWoK1z9T+k8FO1OIOJ87a6EkJC0jMy5dr41gaZoUUgjxeVB5GaXA7G111ptU1njRswc
         AHN484nYNqp4/9Y8iSfIoQKwtAX7KBqpMeiDxm0WbRjL2eb2mAuiC1zNkh7ThtuGkypn
         69Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332081; x=1744936881;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/4rHMPP0tffZ6aLtmo/OkH8XS8Fu3axD96DxnaYzNo=;
        b=E4jxMDVUEfuoXgH8pl7f8qy2sZqjY16Vaz+yNDlxCCju3xXF2wzXiyvOHPiNZ/aixf
         Bovvh79Wc6YJQop9hSoVMv4oeUprb3MRh+mZKS9/XuGTIvs1hx2QAodqoKfcgFtRV+Cf
         hxKUcOfiJNmtsqcTPngjV59R17AdplhRRlQiVxRSyZelk5zLN8f3YiRhW9/WMBXrNNHY
         tdTL90tGQ4fE+mJ5z/83vJ2+88j6NtwsUx56QxTWqdgKetFM961d7F7ISQG9Zf2Y2OGi
         5kKRFbO3GBITp6MzZxjgw852HOyPMNxf2suMi0kmftirREFJ39FEEjE3GHNdDGUBu7v8
         slHA==
X-Forwarded-Encrypted: i=1; AJvYcCVV5CPC3EUu8GmkJzXzJph9DB+wlKgWuKKQZilc2I/T5kx9Fij2ZURDwV36xSIAgibvHC7JKOMHD1KD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7AcX2W9Z5rJtgH3OaRWORDTOaGLb5axifRbByRwOQBUqymJAm
	0YKxOxgyg6a8njZCNqTzWESVLqKphqmFHcbku9Vj/d1qLRFul/FQPTk15cqixB4=
X-Gm-Gg: ASbGncvUJSP4XKpK3a3RT/Uo7RvlbpBC05BJen0+QHF6ImVAPPRiLZb3yh39I7CMHPl
	EUXTQACOirqguv3FZKqzaNrC5AcQRdl7jogE3s/BqGInDIosFdVRCUrAKO3x3NFaQZLJL0KhDtJ
	NlTYeZIbIwOeG9WpwVYC26IZbnQKuqiPdFC0Yu/DaCJh+I9Kp37Rp3hAzxeGlza031QOdgynwLj
	I/gCSRxho8KQGhY2mC9hebE/P6FEC7EB2FAzMi9kxfFpvZmR01wFL9qCn5gEZwyyAC6mjpXrjg6
	IKhrE54CzKHqN2BniKJU9tALzuFcv/yCXZejPIZ0fIIpyT1xAA==
X-Google-Smtp-Source: AGHT+IEANi1v1Y2M7NRf7CyhxCioJrGmWqjbDMTvAkz7Sx4lx+Y+fr7d1/1Sg6nvnkECl35OKVi/5w==
X-Received: by 2002:a17:902:daca:b0:223:2361:e855 with SMTP id d9443c01a7336-22bea4eff3fmr12289655ad.39.1744332081416;
        Thu, 10 Apr 2025 17:41:21 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b63ef1sm37289685ad.35.2025.04.10.17.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:41:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250401090643.2776793-1-alexander.sverdlin@siemens.com>
References: <20250401090643.2776793-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v2] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-Id: <174433208050.2415440.8081203416709656827.b4-ty@baylibre.com>
Date: Thu, 10 Apr 2025 17:41:20 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Tue, 01 Apr 2025 11:06:34 +0200, A. Sverdlin wrote:
> This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> 
> It breaks target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
> when minimally-configured system tries to network-boot:
> 
> [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
> [   26.878471] Waiting up to 100 more seconds for network.
> 
> [...]

Applied, thanks!

[1/1] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
      commit: 36305857b1ead8f6ca033a913162ebc09bee0b43

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


