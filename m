Return-Path: <linux-omap+bounces-1742-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34E92ACDC
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 02:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE331F21E0A
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 00:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60992BAE5;
	Tue,  9 Jul 2024 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RgIZe6Vy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408322AEE1
	for <linux-omap@vger.kernel.org>; Tue,  9 Jul 2024 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483341; cv=none; b=AumpEvifGlLYdhcoTpuWwjE0xGsPH13TyNNcaEER2IQ1+dyAsxPhbMWPA9FoIOQ6LVUIR1SmyXy2+Z651TeSRQRVggsStMUaG3M4V84He5cD/SbS4INbr24PtBoYIme3Qi5EZbUwXsjt4p/AEef+VvYatOcrcZDpSt6Dj6nQygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483341; c=relaxed/simple;
	bh=OOauX8tq2LJz+KMSULP5WUiwetg9GKJNvyK1/MOOyiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j1U6taEOgkTDCHw/jVqYwfwAtokP83NgiQwTPMRPOBJoAnTEOEaFwmpILIB1V6KOfV9pboRUQqgAQZce0I3Wy+OxZH+JbO5Aqxbq5lwhyzIcKWRjWKBvea53oCxMZWVhLDBLxW2PI4wvoHQK4/cE5RZE6zmdJEK+76JHBbTnoNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RgIZe6Vy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70b07f27788so2513543b3a.2
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2024 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720483338; x=1721088138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66ouBKm2rZ2nJ5Sc0zmB/YSS21NPLdbFjaetOeyS1N4=;
        b=RgIZe6VyJLHPwt1HskGIQnxkni1xYTvfmxg/r7pvBdxC//MReA2GxJry+tT1Tr5ylE
         6m1lPzzRa1lZs1TV3Ifp2CvhbqqCthsOd5LztyCE8dDZE6OvJHfEC+1764ij9rrUmSdV
         PiWW5E8zwmAUrdo372CEoD4lJ2BpliQuhmwpuqyN3zwOB7f+IUiPy9xNBwR3i++uV11v
         23gkl+icvAqiUHgEhbOLXb1qaaOvWG4xX4CzGS+gpCdvqbtUDjc/WDK9/8uuqvuwEVUe
         CqqTOM3FgBf/zbXSLHmfD6fVek/8EtWvEwxMuUHGIiByq0eKgYwjJuaFA0IDDJAorXqX
         C+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720483338; x=1721088138;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66ouBKm2rZ2nJ5Sc0zmB/YSS21NPLdbFjaetOeyS1N4=;
        b=r4fbxMHAc6jTVd+GrySLFyClzwjtuiDyRGz0yIDV40GpM6gBT621/gqKWvcJVm0Mpc
         fcxo0WSFPspY5d7V57mW5a+Slpl6xrxYNt+VHSu3hXNC2n5/e8awU24zcmV2svkTYMJ6
         sW9HtuPvotlZ8DlMH67D23mHNTtuYxEe+W/NPeb7ILUxi6PZP/Dlc4wNp8qWXxCW0Igu
         KuZ/2GS3QaaywGpZLnkUrfFwt0deNZvz8Cj7S0wuy7bjrpif8Qmx2/Hn1AxuGhkmOSUe
         XWlrrrObz1nJ6KOZyU07qnaURHO97HJ1kAbqJobXAT7hXXgek6yzlgeGjaXQ7WIlXtIV
         UMRA==
X-Forwarded-Encrypted: i=1; AJvYcCWNh8lUu4oelt3oBvHunMR21+wOvQg1pPnK/7LOpPVscWJRU6Kz9mdgzOZGYnJ+9T/xzHPNvv1i2TTqKagZS5FVl3G9MEBf2EN5Ug==
X-Gm-Message-State: AOJu0YwPeTFhTQlC2pIbAvIkFziH0jY3tG9bSKSXpzeTlWRSrEp9HkxC
	0tI/B/Dewgmf7ajsf/EwvYTJrP2dp8RvXTClan+ksPApQH29EmImacbe8pEFdpaRUTmLveWTH8V
	e
X-Google-Smtp-Source: AGHT+IFjcGACTbhEzv4aX+l5h42wAbm2LCP++X9EO0tatMq6aE+gkzj6i9f/Lah+vuXUnXGwGdjlUw==
X-Received: by 2002:a05:6a00:2292:b0:705:972a:53f with SMTP id d2e1a72fcca58-70b4357e344mr1278976b3a.18.1720483338536;
        Mon, 08 Jul 2024 17:02:18 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4396791bsm462246b3a.136.2024.07.08.17.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:02:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, linux@treblig.org
Cc: tony@atomide.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240505202214.623612-1-linux@treblig.org>
References: <20240505202214.623612-1-linux@treblig.org>
Subject: Re: [PATCH] ARM: omap1: Remove unused struct 'dma_link_info'
Message-Id: <172048333767.3996294.3904790480633343445.b4-ty@baylibre.com>
Date: Mon, 08 Jul 2024 17:02:17 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sun, 05 May 2024 21:22:14 +0100, linux@treblig.org wrote:
> I think the last use of this was removed somewhere
> around the two:
> Commit 755cbfd8cf89 ("ARM: OMAP2+: Drop sdma interrupt handling for
> mach-omap2")
> and
> Commit 16630718ee46 ("ARM: omap1: move plat/dma.c to mach/omap-dma.c")
> 
> [...]

Applied, thanks!

[1/1] ARM: omap1: Remove unused struct 'dma_link_info'
      commit: f6e6e2e8f6440ca2f91685f57b5bcd3dbac1f135

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


