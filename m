Return-Path: <linux-omap+bounces-71-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8745A7FEE48
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 12:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429CB281EAB
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 11:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D703D3AD;
	Thu, 30 Nov 2023 11:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="LttCqIzT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF7284;
	Thu, 30 Nov 2023 03:53:45 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id DA9C66034B;
	Thu, 30 Nov 2023 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701345222;
	bh=reCd9s72ev7gdvAogNCY6NtLVEoSrppdrQfr7HgLR98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LttCqIzTNM2ZlP7EJibwLD7sLpbs6h9dxvlzMab6XrA00laGOCEXOtSCZ/s99BoqN
	 VuI6vQI14PRVaTdg8hcs4x4kSRM6ZOGdZMi2DZlGWyCRDdYldcZr1+SXDWHWEHuhJG
	 t82k/bzWL5te0n4/pS136Ca525PPWiZwEPN0IQpltRSiNe32V6VaTZiA4nPRMHeL2u
	 IHcHRQ1c1JytJAeC80bIyGFCHL7Ab84GMIqWZRkS9pFgA+TrDtUWDfzIz4/JLDHrrj
	 8Ctvut2LRLbPtNTAuI/AAZ2mpj7gKzC0L4pZJQyZEqZwD02yL4YPQnTr2QIpMt2TZw
	 u344fBIgY+GlA==
Date: Thu, 30 Nov 2023 13:53:20 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: Fix DRA7 L3 NoC node register size
Message-ID: <20231130115320.GA5169@atomide.com>
References: <20231113181604.546444-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113181604.546444-1-afd@ti.com>

* Andrew Davis <afd@ti.com> [231113 20:16]:
> This node can access any part of the L3 configuration registers space,
> including CLK1 and CLK2 which are 0x800000 offset. Restore this area
> size to include these areas.

Applying into fixes thanks.

Tony

