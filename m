Return-Path: <linux-omap+bounces-3631-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 594FEAA62A3
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 20:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4494A7C4A
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 18:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3B221D583;
	Thu,  1 May 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VXVRnqVW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29821C9E0
	for <linux-omap@vger.kernel.org>; Thu,  1 May 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123087; cv=none; b=kP03V6hpuqx4rZlfZ6X6yr8c/OYC4QR452KOYlUCwnitZj70QBnV2haw4ojVY8XOL2lZRAdp6Z8EnJd+tM+pofoKI2IsuWFGPfUBVw2Cnky9gMVZEPY830jvF6DGYnAxssFKNqcMSVlZbWCqa9oKmnllUJoNaFN1AdD11SrctPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123087; c=relaxed/simple;
	bh=AYelcBhf4pn8LEoyKEfvxKufNEl9vFt+bZZ8KVzgmAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRMFT0W6AZYcMBud/vqbMapFwr0WtCww9JZkkv9tGcx/YWbQBiI1iOwRysiDu3vq/k79XpUw1+uZntM0l9gDGOnM6epU2BP9wzzCegiJ3srnYlj16yvmdotu/BjXECUu5XXU+k3H1Yj9ql6+z+ahjgV87AhcjBw2lBfp0CO3AgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VXVRnqVW; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1092924a12.3
        for <linux-omap@vger.kernel.org>; Thu, 01 May 2025 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746123085; x=1746727885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/c250bKfSNRiwKkLb79liqUyetsKmHO2NIoAbyk4Qk=;
        b=VXVRnqVWkZCuehGYtGp0JhLBehak3Z5WZBQ0/zi3T0CYT5h033H8jL6jZ0sFnBNwF7
         41WGObOZc5Jqu0p5pijegqvqtXJl0SikMzYA0g4eeB0qSBQu0sb4LH+/nBhF0eD8HmFU
         JpMOB1yy9fCQVZePAnShmUK2xTobxqqox34fI6/h045R3b6Hqow8axsG8THJ63ZSbNqB
         dfhmZFUtvfmXTpp5nTWc3eaaqIaTMTcj967EHXKaABPXJNIRuhJn1in2UMJz1RkE4MZ8
         XNhRvkVW7xfHHv0oP0CP8RofmgEsYNN+r8JztiKVFq4olwp8cUkNE0XPkkjtB47L78RZ
         lloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123085; x=1746727885;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/c250bKfSNRiwKkLb79liqUyetsKmHO2NIoAbyk4Qk=;
        b=XViSROGo1pA0rumYcD9jED4ai7WYMGwU11VCPtKM6ASo6yAPMwAHmOXUYawVENQc9z
         kNIo6M5wMnPkxXjcHDFmv78dVqurfU+7ecxICmO4/9+bAyKXPcPsONhgpRm0QXM51rZK
         LxbEe/dpPP3tPBUYW12X0bcU7FIUFTdyS3mHP5INMJXLBaQ1WBbtgrDpAiZIh0RqPYF0
         Top71Q+gi0Sbn/QsLyDVjecGAUV6xL7qm17h5uWOnJEJFEJAXXQQitOx+CgjTFdxQkvv
         wB6WWTAgFfaajHn8xNdNtQoLn3Qltp5O8ottZLU/z9d3IIKoFItwWgyQFL4QMc7eM5yO
         nOrg==
X-Gm-Message-State: AOJu0Yxb4kv8FEDW/Ru7fhcPQ0sZy+49lDpTdRi4R2iWGdrhUlW9HPlH
	48GXLxzYa+WBV+NqfWaOjpZSKJq7UBP3vXkMY9aDEQR6eK7MGJ6vIPK6ZGnIBY0=
X-Gm-Gg: ASbGnctU9dkeLROhmSzuAj7P4VXIvbRxSfrUd49IlCRE8cazlQ05+Shgm3m09asvwTf
	EBozu6l4jL3eM8veigv+A4pN4vyYYU07CyRdLoa+luQm3m0CKA4/rB1ohirnUxHZ112Ek66bECV
	S2nc9br3kTc/LgoqgPJGRFpwyJYWzc20OsMytGE0IY7/VadZT5/jfwUo5M9mDsF3MwcWmcKbzM1
	FvVzhcxttOXu0Rz7l9rDX9R/Eb1IZkQQW1uLyk2CVJ5LXP0RQ5PGrF0fYAAv6FmJfmyBEIqR8HZ
	8r6u+r2bldGN4Eu8e6kBtNA5biPSeXdySkch6cU=
X-Google-Smtp-Source: AGHT+IGKovrJXgqFnHvlE552aORQpsma/7oOWltj2S8nGTLHFyIF6tsT5L03u3ux/YONXDm1jD+fxA==
X-Received: by 2002:a17:90b:1cc4:b0:309:fe2b:306f with SMTP id 98e67ed59e1d1-30a4e62046bmr108224a91.26.1746123084923;
        Thu, 01 May 2025 11:11:24 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f065sm3937284a91.38.2025.05.01.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:11:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, 
 pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com, danishanwar@ti.com, 
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, afd@ti.com, krishna@couthit.com, 
 pmohan@couthit.com, mohan@couthit.com, basharath@couthit.com
In-Reply-To: <20250407072134.1044797-2-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
 <20250407072134.1044797-2-parvathi@couthit.com>
Subject: Re: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
Message-Id: <174612308409.158405.14880918553210529979.b4-ty@baylibre.com>
Date: Thu, 01 May 2025 11:11:24 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Mon, 07 Apr 2025 12:51:34 +0530, Parvathi Pudi wrote:
> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
> 
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
> the OCP master ports during resume sequence and disables the OCP master
> ports during suspend sequence (applicable only on SoCs using OCP
> interconnect like the OMAP family).
> 
> [...]

Applied, thanks!

[1/1] bus: ti-sysc: PRUSS OCP configuration
      commit: 7d25c4e23763298f46f1ac955bf9b0a872662316

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


