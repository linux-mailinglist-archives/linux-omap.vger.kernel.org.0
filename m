Return-Path: <linux-omap+bounces-3258-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D30BA25888
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2025 12:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92A5B164122
	for <lists+linux-omap@lfdr.de>; Mon,  3 Feb 2025 11:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1757E204096;
	Mon,  3 Feb 2025 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN38jarK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74920371A
	for <linux-omap@vger.kernel.org>; Mon,  3 Feb 2025 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583481; cv=none; b=l74GhWztQ2B/N7WE+WRC+25ue04RAVU5GauHl8t1w4NQajf0qD0o0Nhgogn0yYzotGIXt21wp5gmsLvL1CxwhFCmOLf60busm0LgpsQH/yoCOoQ5Jpa6lhrSsdBLRNRC661qYkl8G7LbCvCJOu9x0UsHQ9vUWWVdE/Q2u68E1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583481; c=relaxed/simple;
	bh=a3+B/C9qR9SxOkEBU7xY+UNus7hELPg11uOVsdZoPq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ApbShZ5xRlP5lGedVu0lWtZiMi9jPB0xcAVuMbxQquw2x4p3v4FDaukrQvcDz8BYMK/mXZ1voC2TlF8E/2VXysqCv2OOvMO6O7UcVeY1NoH5nksRCymkYKcWW7GJwu1aT1nCe+q/TZm2tEyq54p6RYVgtDsISH9frC2ntrRIzxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zN38jarK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa67bc91f87so62966266b.1
        for <linux-omap@vger.kernel.org>; Mon, 03 Feb 2025 03:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583478; x=1739188278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtS5U5hHkmEbrGF76zNcyEUzJmaa1fJkK1DOg0VUedY=;
        b=zN38jarKAL5tjZQaxLdRWqvWrUPMDqoNGUiTlqAGsTOmrlnYVT7s1neGtKx/rZuRdX
         QaknYbxOapSJ6v55DC7uM8oJgPHiRHrZ1WaYNnHpRb4x6nKb7dlx/qZ51crXGVgGB5Ek
         lyZl8SMoKmJQIidkwhNdGziAR6DcsUCJzfFte4fi/3ERuplS/Av9EFfxDNW/JGsDvqBa
         TsJ8AJfTEOOtMN42XXvudBDq+qf+I21OiAU8lb4rYmeWKeFTvFcvmGinS9HoMS21LzRa
         z1AuANVb7dRoAsYcdPOryRVFL9bKb9JzNTG4NBjr8JFjyyyTebOejrCsXRQJLgQUSV1v
         IeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583478; x=1739188278;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtS5U5hHkmEbrGF76zNcyEUzJmaa1fJkK1DOg0VUedY=;
        b=FXnH8CDwE9ZTwWj9Ps1EE7YvbEMdnsT60ZhudCd/PtbQ8DVJiMbebGmzyN5QfhRv0y
         EPbrrx8YFHVL7zcPDu0DtrNpJ/piu4CGBN2q/UYhbEkTAQ5b8U8lpdVIwdIjEU5dMGO3
         uk54cDyjg+eHsNaE19d3QGAsQ+dWtlQO78yxZMcSYFGAtjF3w6LjuwEk13+ZQkXRE+So
         GV4yzoEoMdvZCCw/cWe+ZGz6xfmSQcqQJEiayRwQxxWRxEAxUsqXvLAnkwiieUKR8HxF
         D5NXRGftQdOq3laqaKuHgiOrwCNDxDk3e4bqliuQrAq/KQrb54lfabLUq4Kx6simG3ZG
         m3Cg==
X-Gm-Message-State: AOJu0YyMKn9XMksqWtViOXf8GOABE+6Ve5UKOgaOQ3FeJ9XbGgJe5691
	07EDeRyU28cD5JEHYMxgvRl9zyWY9DweOUO5gKAO8VOUvNjOuUbhBVzDizQwY0g=
X-Gm-Gg: ASbGncsu6S2okHWCEtqXhG9PY7saCXkITQLxdnNoO7k3m7T4tZAAAucsNbXqmCVQIpr
	tFK7HyoDJkS9zqtvcaiWhNhfnGaml36z/Qq4nobwQfgPK1UZtlU2H0wO3U8glbeCPBxe357xZnz
	eYwpo2H7HivZHOyURRJ2mjGKlQ5+cotpQPOkeNkjnwY1CA45RAILF+66fV/VzWW2tIGJvu8erHf
	FOpBQiPqhIDJ9BricxA/Hj4Rel1kfRieaJ4E3txnHzleo5jx8gLuu3Fa+8gMPZTnKl0QnzsPpKT
	my+a1mFflGBy6Ls4q4edXjoJVPjaBj8=
X-Google-Smtp-Source: AGHT+IFsqbvdm9U/sS6WDA/m4bVF2fvOXCAeFt70cnZSY4d6T+2HBo+wOXaFa/dHJ4ynv3Ie4MtVFQ==
X-Received: by 2002:a17:907:6090:b0:ab6:d7c5:111 with SMTP id a640c23a62f3a-ab6d7c5128fmr789913866b.9.1738583478029;
        Mon, 03 Feb 2025 03:51:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a0000dsm739160466b.89.2025.02.03.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:51:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
References: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
Subject: Re: [PATCH] memory: omap-gpmc: drop no compatible check
Message-Id: <173858347701.128740.7167841912808397321.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:51:17 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 14 Jan 2025 18:36:28 +0200, Roger Quadros wrote:
> We are no longer depending on legacy device trees so
> drop the no compatible check for NAND and OneNAND
> nodes.
> 
> 

Applied, thanks!

[1/1] memory: omap-gpmc: drop no compatible check
      https://git.kernel.org/krzk/linux-mem-ctrl/c/304e6c02b76f019016cd492d2d544e07c5753d30

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


