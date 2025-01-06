Return-Path: <linux-omap+bounces-3006-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FEAA0336A
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 117DF18857E8
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE4F1E2850;
	Mon,  6 Jan 2025 23:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="o/+SNmsm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B261E282D
	for <linux-omap@vger.kernel.org>; Mon,  6 Jan 2025 23:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207156; cv=none; b=qE6bJPv2Xrb126kzeEZInZL5MOc9RX4wqoOYqgz8V6EAzjiOcdbt20JqmfxEgOgP3lImg6nbgfMoI/PdPr7QplBwHdUywk3a1IrSNNI++ZCqpi+nd9lvV7NKDnMgw5zoLRTs0x9QtroupSKwakPtpPEOzIpOaEIjYYKhnxOVcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207156; c=relaxed/simple;
	bh=DGNArISdkDKsPNBwLDx+x9aR7QSApN6+BprueyK8qUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h8g4hT8PZspi4dC6ba3QLSOH/TOYnvr1ldPKX2CQ1L70yji/WH14A3xZ9DTguYbMWB3eSPwkkJKLkPBDgeZAkuGRfAFb9JsZOVF/ftctkj4IFIlNmmoRcxa7wuPkQV9S2XJu+BHv5jIEWgaBvDP6ocJjlDHY3FDf/0sBkkYwQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=o/+SNmsm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216281bc30fso249287835ad.0
        for <linux-omap@vger.kernel.org>; Mon, 06 Jan 2025 15:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736207152; x=1736811952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHxna6QIdIRe0UOzSMXnimRv9IAG3QN/UfIhHWqvV0U=;
        b=o/+SNmsmbQcoxQyRu7HWVYy6GZzr9DELeRilb2qwOzgRIORqsPY9/nnX4Y5R0nGR95
         a3JlB1lZJUCJ9iEpuSVpkfYlWqFoujUjgPR71311LeJsociZazOp0AAjOZz6MPnN2EzU
         xDZht7RALPK0VlZjdTdLJ6zg/jNuTKN/yAJ4uYErJVMagJuBIM3uGAjCwYcAL2p2u6RW
         /j3z9cTb54dtwLU9qH1a/oFISB7EkrE4mphCo3vlyNaoKLnKlj0BEXy+rZ1vw5mRs3h/
         u9e+dUPxWs2tqIn8qJPo3P0E5k2LS2wkbh+rptE9Gi20kjrTb8vyEC6l0z8wSyPXEOvI
         R+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736207152; x=1736811952;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHxna6QIdIRe0UOzSMXnimRv9IAG3QN/UfIhHWqvV0U=;
        b=SyIDkio0EYHYzYXiuf9EUelKrvuy1WJUj1OM1V0RP3J4B9OPVtisyDiFJipas1rpVN
         +uYvRIDS9VZmadww/NT9H18RrGvhGmhoJCGsd0+sW56CGo3htO+pIGZ9YdPQf4Mid1u6
         TGw3Mo5yLs97OVpy/+sNfVGWpjoYbdmd5zSAj6jfsfj/hd1EJmiOhClN6P0zK+Ac0TA9
         kS/Gnev1Msjj/arrxGk7WvAxzRKCEFmCZENVwUoQcFn6qymhPZCJK+tBu2NoPM7p7uzW
         Eo+CXrG4RKBF7FVlDG4XkpZoGJUNvf6PLo2T97p/FCYxePduoKQr+tm/U/7pTF7bJa79
         aBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW92vNolgUXR80MQhgGKkHURSo01S6EAlmKodw+8gDOoLOncB6UhiQVsOpYk0ocqL4pRCHtRwAM0It3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy81mdW0s6iHvalg7ZFPPQGmI4B4DMX6iwmemelpb6x44kidYUa
	pAyMh1oBBCnrF126eh56u5Z91YMES2Dt6oFIIMwur2qOXsKmkyha5IJUsrEt/MY=
X-Gm-Gg: ASbGncuioGbFRyuHNTXxA35RiUqr+ZFuPOE0AaCotsHl6QFUJcastFEFA3VC7vOSW5S
	XLYDgccQAPNULDYYeeYXbmBH1YQ82FrorPX3urPU0OZHqY/QJ9I4VFFpHI3Y/1WUycFl9vcyrJN
	vmdAVB0Oj73iyJsvNbSHkEFWO2r8t3GXNmr28bdTRvKXjuUY6O3UPWLVDUhqbrTvxFlBnDi9Lie
	6sqGEy4jWh8RbVKqPECaYDf7NugWIJL/llZUIjZ7Uh7krEWA2V0oGk=
X-Google-Smtp-Source: AGHT+IF1+bYzD3CyGzX7+IANJYXdQE1vBOppX35a3405eJuynGemALeNZh3clE37bnA9T7yQuvpKiQ==
X-Received: by 2002:a17:902:e88f:b0:215:b74c:d7ad with SMTP id d9443c01a7336-219e6f25f60mr884685835ad.36.1736207152537;
        Mon, 06 Jan 2025 15:45:52 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f39sm24893361a12.5.2025.01.06.15.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 15:45:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@ti.com>, 
 Judith Mendez <jm@ti.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sukrut Bellary <sbellary@baylibre.com>, Bin Liu <b-liu@ti.com>
In-Reply-To: <20241220223523.2125278-1-jm@ti.com>
References: <20241220223523.2125278-1-jm@ti.com>
Subject: Re: [PATCH] ARM: dts: ti: am437x-l4: remove autoidle for UART
Message-Id: <173620715151.32831.6502090741933958261.b4-ty@baylibre.com>
Date: Mon, 06 Jan 2025 15:45:51 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8


On Fri, 20 Dec 2024 16:35:23 -0600, Judith Mendez wrote:
> According to the TRM [0] in 21.5.1.42 UART_SYSC Register,
> the autoidle bit should not be set for UART, so remove the
> appropriate SYSC_OMAP2_AUTOIDLE flag.
> 
> [0] https://www.ti.com/lit/ug/spruhl7i/spruhl7i.pdf
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti: am437x-l4: remove autoidle for UART
      commit: f098253378c5c163b1e5450050ca5f12fc3082e7

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


