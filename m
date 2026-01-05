Return-Path: <linux-omap+bounces-5329-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBCCF57C5
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9D1330C8587
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4089338F55;
	Mon,  5 Jan 2026 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qU0FNubC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D71A9B58
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644159; cv=none; b=a5aUBgjg7j+nbEgkAp/1zSIuGseEd0wD2I37n0Y9qmF8BtTn0Qc7cL/xgQFlF4NIcrFpNa7oCn2rIsAVlDZXXMyblI56g79/FDKtOPcDYOT0WVOq33DuCMgc/l7utI1Hs8UvEZvIG58R1/bA0FrkCYtuNx8Yy/NQgfLRZhSmTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644159; c=relaxed/simple;
	bh=Ceyg74x6oDwAJ4y3yE53O3IVmIFKtQCfQE7i8MwWJcM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NFLESFG+dZrMIcenFkp88IcwEAYLZT4zQqzJPCkf96jgNMvMbNlzvWxvWqcvONiNXeGMoRir0Ws/edzBBuMnheQjfkiTvliBldsnCNJG+6Gj1prskv7Im5s2L7ilJgFvYdyxCBGbmtb0JOue9uE7YyVKrE9NSg4hW/DW0W0ZURs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qU0FNubC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0f3f74587so3652515ad.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644156; x=1768248956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU5TLhvER+Rj6zCPwuh3CTXDDY3GmgBOzs42Vt9i/u0=;
        b=qU0FNubC40DKqcnXHa7ljSY8ClQouQU3xq6kPg/IMT2lHNoLiW70H0kJXo8KNLKjEH
         6x9TvyQtFPd5EM1zSrrxLq3Qgw3H0jNlxIKj9TqDLYopL8L4Bxb23UUTtxBuPqYFspV5
         qvOhgYSHrVMzo/DBnyXu4nZX8EwKi/6NASBDOY9ZIx407WyiMNSu3ZxHASna5mIf/2oS
         HzUBCMJmhfeOqgdR0km3LCMT7p/GLkYKi17xYfMxSdLvKcyrZCcMVrHf5cMhktrT8PPH
         oSTflRETBzdPyaJ/jiRA344RrVRfJs/cRZYn5zwRnYO7FkX2381K3Ffv9RfF/wB91e4J
         xzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644156; x=1768248956;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VU5TLhvER+Rj6zCPwuh3CTXDDY3GmgBOzs42Vt9i/u0=;
        b=dvA15Kg+inxPKxUz/YHrDVc+JcN7jSImOX/OYsoiFR6nRIGkgaV3MmJPjtEx6LNrjA
         3Cb2klgaua0iztdRsqzcyNEqwkAHu7cOwZMkR5E+VXtbwr4uaHpwMeA8pIN944pS2bwU
         5Z6b8y4mNI01XN0z9yRIxpnQaLGMznw2jnFYrfJf1fLRMx0lrT39bCRaodzY7F8KcEKv
         XpUncv7ssMNrAyNYtGL2AE+EEovC6wkn30WPCmIGaQ5h5sY74ooFa84DmBtZyig1SMiw
         Zi3r22GLcBbMw0MpwMa6tHOFOEZsCC37ao6AFNzwF1+yFwHL/CwxhIBa/OiXe3Iz6x7n
         7jdw==
X-Gm-Message-State: AOJu0Yz0WnE10BF935zV7EAOmmjd0hARgk2sbSzW7R61eOBUSx8ey5IN
	nUFCzs/40RXLDLCs5zE/lGAKqI5CFIRjySaDSMb1Hduys4zfuGw5+ZgbT4zQl3EYteY=
X-Gm-Gg: AY/fxX51CxIavEL9KAug7E8DVnY4x8pl4Zkrm4iV9LPSiy0xC/cp+ch9yFEgwfwrcOr
	iaCvwzFzSPkf0fwAKkodpHwGpbAU77ZESgM1p5p8+sm3xo7qe3TsTlLT9fL8VvoWwvr1vInK42Y
	rCvszJFJvCiH5bcG2DGTmfz7EgXp6VM5hNfDpqCC/1RoxB8XQSnplKA+9IesMFbt1HBTpvnGpxy
	Rbjg8Rlm0MFHeboWy/B60+ogHmYNtuR2QrL6notRWzw4mfAOwcolkfU9LDPfC44PGmo6MhoGHcd
	nxNEVZ0vHIfeVaM6hH9XcHgivbbwt6bgmFs1OEiddmAym2GyxGjFGDxEn8W14kmX/bcQ4UKgDuC
	MFrhyZNsB2rL2ZkkpiAK5c2uRD2ZtV4wBNzZc1J+aOe4ncftC2Z13Rtf9h6OLLnYJcK6HQr3rcB
	EGE3jEx99D
X-Google-Smtp-Source: AGHT+IG/xH2I7GCpScTbO+Om1Cde1y/sava63npVuRLVWenpmlABf3gdIOxHqsqPOhghWjQRt/IEgQ==
X-Received: by 2002:a17:903:2d1:b0:2a0:f0e5:3f5c with SMTP id d9443c01a7336-2a3e2cef6d7mr6398625ad.34.1767644156217;
        Mon, 05 Jan 2026 12:15:56 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2debsm909585ad.65.2026.01.05.12.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:15:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, yegorslists@googlemail.com
Cc: devicetree@vger.kernel.org, rogerq@kernel.org
In-Reply-To: <20251117113535.2248177-1-yegorslists@googlemail.com>
References: <20251117113535.2248177-1-yegorslists@googlemail.com>
Subject: Re: [PATCH] ARM: dts: omap: enable panic-indicator option
Message-Id: <176764415513.2561401.4701332618728332974.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:15:55 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Mon, 17 Nov 2025 12:35:35 +0100, yegorslists@googlemail.com wrote:
> Use onrisc:red:power as a panic indicator.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: enable panic-indicator option
      commit: 60884f7a982770b1a64d61be7f96214538756390

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


