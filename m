Return-Path: <linux-omap+bounces-4582-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFE7B46599
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 23:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547CC560024
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 21:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C933E2F290E;
	Fri,  5 Sep 2025 21:34:07 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B9C2F069A
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757108047; cv=none; b=CKt8p2VySHlNsRQokQPrtIAmL0ydAWDF3MRg3Pp+jjn0pn8Xmm8X0IbRd/85TL9A3WUX4McTNwNNDi7OLy/RlbRovY8tobLR8SR1/ZFYusitZ9tBckFw6quoLh7QLpbupHR8GiFsWXTth0boPHQQmCxRGiz8UJ6gM0u8Y5XnqdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757108047; c=relaxed/simple;
	bh=OsQ/XCKuRqaR6esTNv31pT1uTGcb2x5eU2Mmmfq90VI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eGxHhTs0Fj824n0WHfH+WRW97L9Lh6bqhQZR6RWa1zoqhMzYRF5Y4UUmXBQ4gUEVlYyXgAK54kDsDzY0yo1ATVX9FiwLvFStvKCS0lzYIJA1jgl+a1nLd4UewnhnOIA7ME9hdphx/valX8IcMTNKmjmPdZpsc5eIV5lrdNMNDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-772843b6057so2159889b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 14:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757108045; x=1757712845;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsQ/XCKuRqaR6esTNv31pT1uTGcb2x5eU2Mmmfq90VI=;
        b=n4KGglKZOqXWK7XkEaVrK2qutK5gNHTeF2+bI9XNw+ZtY4fAcTPsYbHPMXufzO5LJO
         pD46s86OpHFgO911hB2WL5MKTcCft/NXKDgbP61PrnLfyeFC/MvPzqN32gusPwCE6yR2
         1tdPXLtzoF8+f1ayrMqTefwDQ0la5hRoMRJMIQZMr0o/oqPRP1SoRWgXwx7Y/cafBEGV
         NGmdkJI32ioMrzebbriXOjNXt2XY6XTvgt6dCmvAtUIQd68aICA6wbZq8M8GOAZy34iY
         Ocfq96VwyC5XDuY8YJaYRqfKpEUqcBjeds6tmf6hMxxRa+/kB2A3Ao1GyVVyYT/ouqvI
         k+ug==
X-Forwarded-Encrypted: i=1; AJvYcCXcXFzGEmiGNXuRkSRTkj0zI8fjvVUg60nuMlYHN0vIRwRLtt3cIxXO15/AfcS8LfXKsDeVGdZnK2i2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8D/UDu5l45qfP+NrB90fWhwlhoRNyOyYu4xjQXiFuMgV5syBy
	yXRjhtih0KZGoLhBQLxyamdyxvROZcYMaRyGVmPn+B8xPoZY46/QccX9AcZGRWQcGwM=
X-Gm-Gg: ASbGncsT01XzrbIjUfZtA6i1GNGODnFRZR4alUwAMeQ7iSXxazlKOwP4ok9OY8xMeyi
	VleGrOrcctzLttoxHG+7A/O8e//Zn423LdeUsXm11OEgUkEvxW/7vfgnsaOgQfCAQ0xVRE4ivtH
	07V84uxKuMqE9ZJoJ7I0g2bKiJx4wwnsUHz9a1UmONEoKQMhKj1B06eSYjawnTi9rwN5Hsl5g5l
	Ovex+9ATcKeVFRP33uUMwjLJ+6iVABMrrc9kX++wxDJlpXRsJJXlgsrMqIFojG8xJsTfHlyGQrr
	Zg5LeflKSvHWuqqseXcUTE11yMBdNTLsMAsTLPlrV5mb4mDNk+WnF6uskDElQfBCLzAFkRe8TSA
	cQf7xw+ATQsvu7piDrInX
X-Google-Smtp-Source: AGHT+IF98k8Va16MpWzLp3ZggTUXIe4e54bFUIoKsXM557PE3M1cHZME6evE4tizbxZ5oXDsMeINTQ==
X-Received: by 2002:a05:6a00:181e:b0:774:1be4:dced with SMTP id d2e1a72fcca58-7742dccafdbmr309740b3a.9.1757108045347;
        Fri, 05 Sep 2025 14:34:05 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1b21sm23273993b3a.69.2025.09.05.14.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:34:04 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, tony@atomide.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, jihed.chaibi.dev@gmail.com
Subject: Re: [PATCH] ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal
 property in DTS to use correct boolean syntax
In-Reply-To: <20250822222530.113520-1-jihed.chaibi.dev@gmail.com>
References: <20250822222530.113520-1-jihed.chaibi.dev@gmail.com>
Date: Fri, 05 Sep 2025 14:34:04 -0700
Message-ID: <7hplc4a8j7.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jihed Chaibi <jihed.chaibi.dev@gmail.com> writes:

> The ti,en-ck32k-xtal property, defined as a boolean in the Device Tree
> schema, was incorrectly assigned a value (<1>) in the DTS file, causing
> a validation error: "size (4) error for type flag". The driver uses
> of_property_read_bool(), expecting a boolean. Remove the value to fix
> the dtbs_check error.
>
> Fixes: 262178b6b8e5
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Nit: fixes tag should include short log like:

Fixes: 262178b6b8e5 ("ARM: dts: split am335x-baltos-ir5221 into dts and dtsi files")

I'll fix this up when applying.

Thanks for the fix!

Kevin

