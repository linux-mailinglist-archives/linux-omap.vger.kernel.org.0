Return-Path: <linux-omap+bounces-2313-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E0991112
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 23:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E2928442F
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 21:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855D31ADFF8;
	Fri,  4 Oct 2024 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="z1EAhie9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD864231CB1
	for <linux-omap@vger.kernel.org>; Fri,  4 Oct 2024 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075767; cv=none; b=lBM9hE2PsWe6Hl5EQJINjdnyE7UUlR42oV292ZdkxrrOHeSbJhu5EE0kCrGHG6bvoJnN/p994ZT1gv0xfZr3B5v3fydpHT2NGuNNcidIptflXlMd2RCIZnPD7c1G37aASXfQNmtQyuB76OYJ6+/MJWitcagt57eYmLteDL24MAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075767; c=relaxed/simple;
	bh=Z0fJUiXSWKF0/oClww5nKjc/i6T4KrfOP1RoDUDQPuw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T+ytqOgJKDolzi/qGYCmRYhyAe1eoTSvc+eE/zFamnQFm/RZOKqeDKcKZbj2vKwIsQVmRZB9QjQR5kDo+4gflvIKfJo9wwvXoZyjokFvbvZQuNG7K1XsvN5sgvkCo4FEVG0a33KeGuYqCqKwIzEvuvusp+IFdW+58RA7u4X1Wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=z1EAhie9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b01da232aso21186955ad.1
        for <linux-omap@vger.kernel.org>; Fri, 04 Oct 2024 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728075765; x=1728680565; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0fJUiXSWKF0/oClww5nKjc/i6T4KrfOP1RoDUDQPuw=;
        b=z1EAhie9MGLkjxXXM7AhbkKvyCIRHeO/QJwco3IMNMyAjnzVcJ42lr2A8HWHhqJCIA
         L0bXETTLb6eYku5IFpN1vecJX+TrQEComrj+OR8Pdxg6gdXmnJxZyITQJvFKDcX8z+++
         hMhzhec2/UcuLbtWurrtCX4+/o8C1BrKpMQcYiQ3vZoRd7wS6JCP+stuQx7DWttaC7lh
         Tfhv7EjE7bQTZ5r3OMrpGQNnFyNMdUeU8ZPpUy+qQ13agq5i4VDE70bkQ85gMiJpCaRq
         4MGaRm5pji561LcCwiYbY9HbEwto+h4veBWOeZsqrN0gPvr67QuMC+DBIBUMTctPrfFE
         no8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728075765; x=1728680565;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0fJUiXSWKF0/oClww5nKjc/i6T4KrfOP1RoDUDQPuw=;
        b=n+LIukTnEdueG3nSZtGilClgPFbUkw7DrCDbFJdbkgR+LwGX2cyjoi4EPRrFwZESsh
         k5pedwUH11MqqUq29dRimIrpxjfMTNT5sIvsRPR8taECyp5lM8qv1iyNla6Yy3vsEZSB
         vd3X23MkiAW3N6wU4A+FjfgaC1n9NSpDW/GohK3eBgBCtXeiKyc5Bd+JdZEP28/LQi+G
         U5S4+jsEfw3qDKXFc7Xk/pUzo65pl8naJkMGrDcSYcQRjJ4lV8lEnA3R7ouc3RSImxc7
         HP04smfQXQY7WvJyIfIswGWvCaaJlcRqjEHBcc4CNQ7NUtJHUsmS/5YMjUM7uIejrc6E
         d3zA==
X-Forwarded-Encrypted: i=1; AJvYcCUXzULeE8X3/qi3uuDkiiHW6BLKMpiFSlDkjfym44QOakB9wjWoeysIfWwlR/AEGL06+wpi9A5ACMqz@vger.kernel.org
X-Gm-Message-State: AOJu0YzgM8mQav9mabAJoVynvwabzNpgT5AV7mHrSlWRsfVa5oWiZda1
	Q4Ye/sf+SwnZNNqp/1V3Iw1Vja5d0EEJIB5NCdsiF1lbaq4J1m1L+b0KSIR1AC0=
X-Google-Smtp-Source: AGHT+IFDNzDiJhD0c97txDHvcsLQ1YdPdzVbr7H3zXAo1awU2N/Zgy5I/d7MVIKR+rnQSS0tJO808A==
X-Received: by 2002:a17:903:230b:b0:207:1845:bc48 with SMTP id d9443c01a7336-20bff589deemr57720895ad.30.1728075765165;
        Fri, 04 Oct 2024 14:02:45 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13930b92sm2677745ad.128.2024.10.04.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:02:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Paul Walmsley <paul@pwsan.com>
Cc: kernel-janitors@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/35] ARM: OMAP2/3: PRM: Reorganize kerneldoc parameter
 names
In-Reply-To: <20240930112121.95324-2-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-2-Julia.Lawall@inria.fr>
Date: Fri, 04 Oct 2024 14:02:44 -0700
Message-ID: <7h7cank2dn.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Julia Lawall <Julia.Lawall@inria.fr> writes:

> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
>
> Problems identified using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

