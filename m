Return-Path: <linux-omap+bounces-3009-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD3A03370
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46613A4FB7
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9EF1E379C;
	Mon,  6 Jan 2025 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="APNpTu6V"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445701E1C22
	for <linux-omap@vger.kernel.org>; Mon,  6 Jan 2025 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207157; cv=none; b=p5iob+/iCiK4d0kJjtOJebZacOBxhZIHX45zGJg2wBnEhlYSjqLcwePU9V+8VMqMWWvzuxvVe4nezmtMFXum5XuVAViwRcpzWrUx/ZMAAsP2ilS+h6gHsXoeUc+PHmdZcvxKlIVDU2n9twdISMjbcq994bE+V9zzrmDBPA1tICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207157; c=relaxed/simple;
	bh=SnubxgDV7XRj+Aq2WIiIrRUTYeFD1xlemlqatH1jtys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HoxfYG67ut910zGYNMWs0Pk6zZ+V0Vs7EJc7ZfkJQW2SYERFOqwsraoRp9JN9o7WMjN1WYRbyV0AjCmz+Ov6e3xq8uWyx08bSzp55enKxXyt71Xt1fCY8zrxAX89oJvbcDZIpo7DW4LRbSQj284nuhCdZD/fPWD7VfQTizdrc+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=APNpTu6V; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21683192bf9so212906295ad.3
        for <linux-omap@vger.kernel.org>; Mon, 06 Jan 2025 15:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736207154; x=1736811954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjmN2PIfwC0c0nWPz1YMbfBRG3urs9KsCMv2W556xTc=;
        b=APNpTu6V0PAQU/qDhHhOd0IEwPVAxcgfSC/8RDIX5nSmoJSJoq/D738Q/oNtirKFWV
         KG7FwwrXxLglmuc5HZkM6Obn6Phq8PJkcPg1hWrN9HKp6h1kDj4LbBYYe5KKB11sgyzf
         vlmnDd6SGMUUzKJFIzGFbMN1P34mxa8d/jJDTnghRIcSFKDI2Q43uitAywOMxHq73gwF
         Ewve6XULU2jO35lntyG1LaHiGnntHM5jiKhBZ10kRymwq2MqIFNjHohgdrgphgC+qEOd
         7QnvCobNpG8zKZh7ppByEFkTfZQQfVrCdma6H3ZNdVVws2Q/QeLQUt8Rq6lWbNePDrPY
         MbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736207154; x=1736811954;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjmN2PIfwC0c0nWPz1YMbfBRG3urs9KsCMv2W556xTc=;
        b=c0Magr37Kly//gkVwbp3CPL/ANjkrQHmM3Y9IszGadXzZoTaciyDJa3T4S7S8E0ImX
         +Sy0Be3+ADrGw9Zq6rr1CkzjfC6r6ggE3qM2w//uicB4OsWSDAXJ36FChLxvsxg9wvkH
         DWBoTiewgjvUBaJO9mX+Br+znLO1J6rZW3MebbCS7tpjW+OiNpINxMsHjhDnGA+ynb2/
         U1lD2z2EfMhqVgdYUrXvI+FMulLMEZ7Wj8tes4Mz7BIiuaZ9v5sdSA7+lWbPCxTthiRM
         99EGoHhpBUGnved7CjU4bctbwZjfmN99uuNZglJT1aLvDlDiXCfsINyiyAl7nNyL7vJJ
         1+kg==
X-Gm-Message-State: AOJu0YxI8O+UZup0MSZFYEfktG3RbAmjlVzaC1JVA9DRE0H5jGs1fB5p
	olMPPBCSlPaJsJRpaFVLL27Cm9yKPH60IMjJnfegoMSlj8aFk1Cuhdp9NMJlbcU=
X-Gm-Gg: ASbGnctH8YN88wA04tRQGl84Dxb4AIvWYMs2e7BUiRUuEmaRgb6P2IzPIjxRXYSmhdq
	ReOSBJAe2wOUqcQHSvaLPoSVQwu6jKgfSYyYmQfXkFbks0ye6tM9O3eGQkqNUpJnLwqBECd50ZN
	2KLdk+QRW9FDSRTIzrN+BBszTfkoLqw7QsrXHdqzQBSyVA8+u1WgS1rZuLiZU37zs212wtM0Yhb
	Tinilx5W7Vr1ofN2S+kyzztj1RXEalJj0KXPqh002mrOzlobpG6ISk=
X-Google-Smtp-Source: AGHT+IGbRHs2RzJb3MSieBXWa+Evc31amSDQZTAZ7zwBIJ6+kd/xMRR6MvgmWDxKaWb1lU/MgC4T7g==
X-Received: by 2002:a17:902:ea03:b0:216:5e6e:68ae with SMTP id d9443c01a7336-219e6ebaf33mr879106765ad.31.1736207154513;
        Mon, 06 Jan 2025 15:45:54 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d4635sm299184755ad.162.2025.01.06.15.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 15:45:54 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
References: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
Subject: Re: [PATCH] ARM: omap1: Fix up the Retu IRQ on Nokia 770
Message-Id: <173620715371.32831.15131354079648305645.b4-ty@baylibre.com>
Date: Mon, 06 Jan 2025 15:45:53 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8


On Wed, 01 Jan 2025 14:12:15 +0200, Aaro Koskinen wrote:
> The Retu IRQ is off by one, as a result the power button does not work.
> Fix it.
> 
> 

Applied, thanks!

[1/1] ARM: omap1: Fix up the Retu IRQ on Nokia 770
      commit: ad455e48bba7f21bb5108406da0854cf8dede8ea

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


