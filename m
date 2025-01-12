Return-Path: <linux-omap+bounces-3095-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84055A0AB36
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 18:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BFCA3A4779
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 17:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6171BEF97;
	Sun, 12 Jan 2025 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="BcdwgXW0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1D2F22;
	Sun, 12 Jan 2025 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736702004; cv=none; b=NxhYG5Oz1myqnHRBxKqtb4kj8S01gF68r40kYeYa7U18OPMs44DGXMXuKW3YnWRXgL2HoTdyQFkJdzEsgJguFOTsjR/XNKYyh3sWTN0eXdu4zFnQTjK1hhzQpQNDGIjIGWuL5hzyCK6f5kuwuOTyYVNQ4UM6EDBmfV7+P0o034U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736702004; c=relaxed/simple;
	bh=4x0uY9DMWsv/WXEw/K7V8vLuITfzmDcnJ4mlLyKB/u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4VG5i+msNbB0DWleSp7i4Ax74FopgPLp4g9lBaBU+urUpmLpHBSmn+dlvUx8tS8yMQlK5NDErUWDyYaXoh76iDeYVudzYKs/b7LVZnl6VtAbfONp2dyWD2VbbjO10EoXQuDc0lsaMOL89GhxCuGVTlq0LIncdQBmYBtjdgZtmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=BcdwgXW0; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736701999; x=1737306799; i=deller@gmx.de;
	bh=sAk83XikXRYKdhscJgmKLTv0gi1O3FWuybX1Gz6XBGM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BcdwgXW0K/i1pBctjzPuAS/saYvJLBUuVrZMAauH9bsnFpChsmX5I5tH/zu/2Oxr
	 wGMZV4/lnOZAHPyZaoqHCWn/IFPSJ7BYgaBGWYHCqXXM+RRzuF7W50lPr6FLIDR5i
	 0tQnOoYqXVNYDELQife6pDKK+/kUCLLEeuUz6aIR1b28gJlouJDuh3gRAZCCpoKL8
	 Ko42s9+On25ZVd5i0XrvPuH7bvSqnPP48sWlH4gVDlFyMH38JmWBsk63tI5r9TxJM
	 w/d9TlCLLF0j9/5rJtKKBx7gBkA/0TyfSbWRE1hZ91852ejyD9H6NnL8zy0mtG1Gz
	 TuwN+k23Mj3Wr3JUuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([83.135.220.190]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDj4-1tiXIn2Niw-008VVj; Sun, 12
 Jan 2025 18:13:19 +0100
Message-ID: <d044eca8-deb9-4943-b296-a08fa873a5c0@gmx.de>
Date: Sun, 12 Jan 2025 18:13:21 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev: omapfb: Use of_property_present() to test
 existence of DT property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
References: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250112134634.45991-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eg6cccG6U9xt+8O+GDW4AER7xAdJ8iSMuQ60AJgbWh/mb55evy3
 zVwBZPgoYDqgmfcgSCI+lB5vKXOz900bguorax+DPpQoM6NTgA/Dp8WmIWJVLRUrdOObywv
 flJ2Sq7Lgf0BJrC0VHZuhpMXTJ546WmGZz7UDy+czqbglzuA5Qave9Ojgxx+u+84/cWAHCH
 hs4r5mFzJVsfMe8OiPX9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LZs70DyDanE=;aWyd++HQdXwAaIm9brSpAiAbedB
 A28MHs0ZKUpz27Sfbu3hggg172iMAWrA7T5QPszVfqqsRXhUMgCOWofAPwFPj6Jef6HiFaf3T
 zDspi0U2LD/zqA3t67mWuJ5OCi9opa8+A8a1uKGwZyiq50xPqqxc/MuAVNc6M1yoUC/H8Deb9
 yXs6YgEpbzMZFA531f+dGlzrkHAJJxdcWGHdc4TW6vIIm5SV9UjO6oQ58eCbkPWS0pT8sAyrU
 Poio/sttZGBN85nVw0KfGchs7FGngdt/XT8Khl7aYZOOnwka7VZX8f+H9V2sk4hdLdxphjagS
 o72glSTs/aJfOHNZec+AvryCaXU+hlm3PY6JqqJdpdFgg53rkJyuJawmRdRRVq5833Tv9GHvk
 28PoNX/sqlynmc9CqqsSvwlJEu7bwYTIcn7T3TWmoJXSCvqsHXqgUwpyZcpCYieDkDPyzZlJL
 TN8+zj4Z16lPvO4W6LYoQ0XY0Gun0A+Y7r5JKONdPP/exHAnQPfqpDQOJ89zONchHEgAJrzog
 k+vwojurKiIFhvR/+Y5wPW5QySgUJwVCQ5u4vgRiIvaCeEEAb/s1s1y0ZHl2hBNRSbTECHzOJ
 GJ/bouJnIIaxAYTuyTH/AiFaUiIBN9jCVqmmG+NVxN3NeIHHlREpJ5uS/5njBnYSCgVVwnoih
 Zp0R5W4L0Scu5yDmtMBh5NGLpWeLUx7iUmRi5Vd5vj/C7o+wTM4Jz/6eP6pFZMrGFjRxUJGVv
 Vs0wefPXMEUyhgEOIwp37f3dpqPochVvpU9wOHZMOFvtD8+FGhebtsFwdp9b//Y06pG096MB+
 2pAIsoD+nscxsK6Lz21lSrPIBhH4TpsuDjzYgfxbPSMGuPtaLBhCOS0zgcHb5SYhxvxJU6N9y
 n1BDHrq5wRI6u8iHU/g4xZN3WKxPWCj50Ps7Ao4WfXrizo1sk61Ajce6JWMLYZLDV1FaHS5Nu
 JeqLFT3LHd70kyBVjF76qLi/WIxziqduCFwRuezqY1By2jzuv6KIBAXIv2f1A1BJU1bl4zTs0
 QZXIwySV+LewkuaqRCO9UDHZTANe61EpIZK1RrK6AfqmeWV2KOHqu/nrg+whQ/ovf1Ai652Ek
 ZtEVg//VSSP+jwAqMFdSBp1syK+SGJ

On 1/12/25 14:46, Krzysztof Kozlowski wrote:
> of_property_read_bool() should be used only on boolean properties.
>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

series applied to fbdev git tree.

Thanks!
Helge

