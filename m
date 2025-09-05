Return-Path: <linux-omap+bounces-4588-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E89B46696
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4436A45B77
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAF028C866;
	Fri,  5 Sep 2025 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lZhEdEOd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03EB288C36
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110937; cv=none; b=Cul4CUsqJzwUt3KK1SgZ6cOu/V6b7ubFn6rNVn6z+I3MeSNtMve4xDcZIzujKaF1DlqCkb5adpfnvjFOJ8Zr9OmV7O6QZ3sgb/Ay8Gn+nr4p/4LVo69ch6Yprch42bvstezZ18Vxkb/XXtX2WSk1TMvd2VQrxT4XJ5PbPs0r05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110937; c=relaxed/simple;
	bh=P1j50aF35GnkXQk2lVmzjTni8Ue0o+yg2rhWnEq3iWc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ju9Inj4XnwzbfcipB0EUsDKxNd6N8dYVC9ib5knQJ09wr2K9JyqNEoWoJQjNTyeaA2wR0mLEX9tulDzDjJ8r1Vjbo47R2QbHPtMhp0bKkLyDNVx3a1RqXccucu4NifHNadCa4Zbqo7CXvSaV//2Wx1ERyUBmaCnsH/2+uh0PdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lZhEdEOd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24457f581aeso25525385ad.0
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110935; x=1757715735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3MoENRKP6mYeZPRW/pxLj4qhNh7qVu+dXlOTgSs04Y=;
        b=lZhEdEOdtRkzD2rOLWVSU3Ocgh586guK3HJkZg5DOuvksqR5M3EuVbOEJ07zLx1+Va
         OMuSxEr0wPiiOB2vwzvNEB6l9XJMU2xfvMrKH9OyjwkXbwMNYWt47dqEpbX0weq5kkXj
         mbq/dEzjgDcWiKtXRT9KIPZ/hbyEeFAUXO7Xw07TTTyvESIuU7QGId6tJ5IiL8/7z1qr
         /QKWNBEmXRqOQ8yN/ph9JR2heY8n9c0JhFRF4sUoIErUmSqEo4p/796tjyFviaF+dcB9
         iJQ8xdHBFQO6EyBR2Wof1FiYyNayhW4EWk7K4n8sQfq5tg3KdoqQwwwYB79iIjtcpx2T
         3J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110935; x=1757715735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3MoENRKP6mYeZPRW/pxLj4qhNh7qVu+dXlOTgSs04Y=;
        b=TupJDoUTeyDUuS15ayH8mM5GX0gqR2n3JOowoC8dkGGDXMQ89+7/qkE96VGPOs7jcL
         7QOClVQYhFlSHLm5WDWftvKIpgtMdL5U6Qd1FUHtY1o2qt4s7r7yh8VMDwzLFkQ5UzQC
         vT8/RfPG3ncClZzfnS6Kdtf9nnIHxI0O1rBaMCNbY7zzrqbAO8tqx+udj9WQqkb5ohBD
         weXsNO+PB585Wjvcp/YiSXIrNyEPieY8XFv3BwXudtmnIoWv09gtz88K5N0tBWZwIHh6
         UjoSZnuGBYlKfAQoBo1IqZ2hs53uWt3Z/lAVyA0Eif+g06SMBy+Xj6vIxYA4qr4qX5pF
         dUkg==
X-Forwarded-Encrypted: i=1; AJvYcCXTln1OkoutniBW7M3qWWhUTqFTwNmgbJ6kpLaHc5GV0jrcEqOqMJOXVJ9U9xAjf8veZLULzGU/fY3z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyek7giiqh/+Ds9pJHDpk3fH1AZk2KHCbGjBAeb9e6m6NVEMs7x
	3jTRciYZeQxWTu4Fre72tP0MLKpWuR66ikbhX36EluFRg3oFA0zNKjWL138mB8h3z+gUOCDjcdR
	7Lfe2
X-Gm-Gg: ASbGnctl+MG/K9yRqNG1s2U8q9gXwWU4z1eklxLLbzCh3WsXQw82u8vRAMriVCeDzCK
	s2cOc7VtlyElRJyVUqtZKXFdHsTr/imgd9+1O4gMGhzXLtWqt0/91vGIpWQGYEIMUTqA+Amy95X
	fS97Y5kkLOrBlQKe/LvAI9aSKfDPXEsSHkbu4Yn9ooTMBtg3xqT/+GI5S9WwwZ9wu7kOaBmbCNm
	ECkBYBKAfTqjSoiTZqWW6Ba0We+iAW2aQ+oOhvNgqWbrQgUxcvkJ7lTpd9lWdsgq7cqSOnbMHss
	4y5rD2azRq73kD8z6yReCHf0iIzn+p/wR/sJqcZhftfdeWYupYVDEzB26SXjnMMEGNzWg2ob8nI
	fGcxQpLeOBrsMyeVjrU+R
X-Google-Smtp-Source: AGHT+IGFh7XSvm1jmSq5I6nF/CZdeopZIBB37Nq6xs75hcHOkaln3WatQDx6FOTZQCdDBErB40YFkw==
X-Received: by 2002:a17:902:dac6:b0:250:de70:cf9c with SMTP id d9443c01a7336-25174ff62d3mr2891525ad.47.1757110935003;
        Fri, 05 Sep 2025 15:22:15 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea628sm33047585ad.6.2025.09.05.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/4] ARM: dts: omap: dm814x: Split 'reg' per
 entry
Message-Id: <175711093408.666031.690873725302943205.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:14 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Tue, 19 Aug 2025 15:16:52 +0200, Krzysztof Kozlowski wrote:
> Multiple entries in 'reg' should be encoded in separate <>.
> 
> 

Applied, thanks!

[1/4] ARM: dts: omap: dm814x: Split 'reg' per entry
      commit: 46179394d4e45d561a2c0185774c2f7b88fa7c14
[2/4] ARM: dts: omap: dm816x: Split 'reg' per entry
      commit: 7d7df1bc644a29e880181579994bd2da9fb1a6ce
[3/4] ARM: dts: omap: Minor whitespace cleanup
      commit: 9df7366a29192f860e9e35a258f0b000b6e4a754

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


