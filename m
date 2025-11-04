Return-Path: <linux-omap+bounces-4839-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D702C3353C
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 014414EE62E
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBFA2DEA72;
	Tue,  4 Nov 2025 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Rs1LOw2L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C9472604
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297615; cv=none; b=qqNLJR7d3m+YNG3ygXZjw+KzN9IKbIQVVRtP4Pds8DYZCN+zpgB3+2kUiI/rFEX6s2y1aakgclXdN5L9/QBmLqJ/r/IRjkp+LTP95MZ1GANs+1MLO4moI3TAO2gOM8ecKOC1R/YTFguaq1YkjjMVEjTU306yVLYyjWfYJrRUGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297615; c=relaxed/simple;
	bh=QJ847FhBTFOXl3rS58U8cqQ+LD+SFOtAjEolRkbcjsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DvOC3x3ihAuAqRVqc9LTYvMMZzjttntQoeo4f30NeHh4KBfmG2tPe1IeuEFcLo2TBV9UKT84pdcj3zgqH9oNVU3I6d2VagxdGI8I0rutjVwPBGch/c6cx7r44s8kdznmM2Um5ya/y4xr8NmkWhWU/a2QpkfIlTpV+KA4B8eO73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Rs1LOw2L; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2957850c63bso3230885ad.0
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297613; x=1762902413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JksZ5o2lwKHDUecYiEPxGzs4V/o270DnmDoI1y8aqwA=;
        b=Rs1LOw2L+DrT9mYXwC9V31w4hLwnREy+jwRhDIIU6IzfCD4tOH60+2atb5kHS4o6jo
         62hPTPPTKSyR9THHDPkXT4tuO6v1PQj+xU6LQAu2khP7NhigMTT48dOucCQfJz91H8za
         n/RycZ5grYbsrbNzhF3SRRnuycqoZdFqi+p/ZOgmhxEf6DTX6g3Os4K/7O2cIae/logt
         imBNQxJT6j14BLIPlgn1Uy5j/Il1utwrvw0iFJ4Y11jEgo9hQW7KAI7Zkwq2VE8PMbc8
         okRJh7g01wT/ZC1gTXLMg/SS1pZKxLGQd/pnGBfE5ooDs+M03DUemaeqvH7oTm0yUYrA
         +s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297613; x=1762902413;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JksZ5o2lwKHDUecYiEPxGzs4V/o270DnmDoI1y8aqwA=;
        b=tTCHdh42OqsOs1tUefmTK0kDc0iTjjuFnIfhFXkRq4pdCzKd7OLdCyOxx8+D+y6df0
         zscbGhPFD8Y2md60QjCYZchIO1d4uhn2m89Wo3dP3aBbhpf+lMEC13XlGq8WirqyfSPj
         W5DWUmUp+Jj9XsGYqLrTWCGWeZCjL1tF20jjuorp5H6fWh8CbMojJMk1VBrvaLLf2kw1
         muDlXokguI/f5H4z9SpyG1vV028DvmA163skIAeODT8/mkukta/hq7om5mIkYFu8rDNR
         jFgd2nIpa+8ONu2enZTpoS/ejki82Zmh4vwaFDq7BNC9E4U8cTvcCBzIzdtiOHKxp/f0
         ZxJQ==
X-Gm-Message-State: AOJu0YyX9vUWDQe7O2BasbCG/8cZFX/Nhj86aKg43rXFmKfGiniyEP7o
	BBDDFnap60H8PP24P20y9PyV6odIXuheMuabGprMx8mOexOdMUwvRIzJpii8iPy8raU=
X-Gm-Gg: ASbGncsXFR1e8+y22Nx6SN+MAhtJG4C0CLxNC/KpCIr7gKdYdPenqZea9+0yuDjs78F
	9T5vgZI4PHl3ZcjJo8Z0vMhbJDlP7g47op76mxwfKIYni0BGNN+m0HVCSeuslKRTk73VAGwGhew
	IEOTxOjA/EhjRPqE+hxzcq1i4rlKVAg2fzBP2P+Jo2Onk4WrfCcE8GjV8gbSBdZ+c7J3wXRC57r
	8A+O1VBZ8SiZrmofLuN2uqxqS4QLOGIGIKFFU0P6+EpxmCVQ2OqQ924Fd082lVCnwewAkHYvj1p
	WM7cnQEgenru4hLJIbQbe5bYL65c0RLlnNS8cMMfccVWmBbBVJf6m2/9W4nECjUcn6e86GYx0kn
	AUroC2nxks2PvY2Svkj6aFPFn8Yp/0V9W+F6sUTi6hi/SyBWzx9UPImdJqDvrbr0iOoHVUmHHew
	==
X-Google-Smtp-Source: AGHT+IHgBsxoU/B15KIiSeBgrpUmGN8tjd9N+/uuPPIkB4RHWM+GjdD2qRRDjV+JNmhejAOd2Mqa3Q==
X-Received: by 2002:a17:902:c952:b0:292:9ac7:2608 with SMTP id d9443c01a7336-295f938f88dmr64337615ad.8.1762297613341;
        Tue, 04 Nov 2025 15:06:53 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f87a6155sm3462327a12.29.2025.11.04.15.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, yegorslists@googlemail.com
Cc: linux-omap@vger.kernel.org, tony@atomide.com, robh@kernel.org
In-Reply-To: <20251006093517.3075431-1-yegorslists@googlemail.com>
References: <20251006093517.3075431-1-yegorslists@googlemail.com>
Subject: Re: [PATCH] ARM: dts: omap: rework Baltos LED nodes
Message-Id: <176229761250.2840692.11737049086914044356.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:52 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Mon, 06 Oct 2025 11:35:17 +0200, yegorslists@googlemail.com wrote:
> Add labels to the Baltos LED nodes.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: rework Baltos LED nodes
      commit: 905664e27647224b2f5f29a1825c3d6bff3fc49c

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


