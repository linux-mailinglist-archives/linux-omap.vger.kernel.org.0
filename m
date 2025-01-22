Return-Path: <linux-omap+bounces-3177-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F2A1995E
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 20:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 039E1188BC81
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 19:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC176215F7E;
	Wed, 22 Jan 2025 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="C20uRui0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74EA215784
	for <linux-omap@vger.kernel.org>; Wed, 22 Jan 2025 19:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737575534; cv=none; b=RuE0R5p8cSuaHDCcDQxFF/yNjG7rlkP/SwCETXX1tPC9Vivn1hYBTWe8qGABlswA2x9qLD1/8C8Toh2D2TDD5TaGQ5B5ucvpbGKRqm9pTrCZwBmmW7+DzJxnH86bLRNZdJ8KvREQZz+m7YEIDiqYoD4eHo0jnUNUeZBiJxI7cF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737575534; c=relaxed/simple;
	bh=+JLleq60hwwXyg8/u78q/jC2Cf75ZDGkYjtAfO4fDWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCfRvJGe/LbBtPN16oztGcr35bWcIun1y8AQkdSNizBg6HFeKV2CQVYKP+NhO0IjxzR5HydvFvMHYx8ep+4jbWcBB/kkdzhdrQffNH8WQh5yKbmjF1U/rSzPn5B1TGcvZ/GANHjkwMIL2a1av8b0dSKUk7hpRWFidQQcJQ8XU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=C20uRui0; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6f8524f23so7915885a.2
        for <linux-omap@vger.kernel.org>; Wed, 22 Jan 2025 11:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737575532; x=1738180332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9HOwy2WEVIU7BfR9Hi6YlozRvVhHW+HM5IexkLGPzc=;
        b=C20uRui04+BpqOS/SYLzIgbCCJ4XLAM6tzQds4n9HgVhjRsEZnGozhYQQOJkKap6uz
         vbp2o/HzRcspTFPNuymSs7ZoI3OPLqVLwyOiaWkY6u4oG4DizNVa5Qnn4Lx0E53u2jpS
         UZPWaC20YkLRbIuYm+dVvNzR+uZIbmsQr46Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737575532; x=1738180332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9HOwy2WEVIU7BfR9Hi6YlozRvVhHW+HM5IexkLGPzc=;
        b=I6pIl4IgUrQ2Ezwa2rZ68ZX4p+6ekjAwDPXHh7xfgLnRW4zP/so+t2cP19LPripZkr
         7CJ0FZBWbREbgIJTt3g+KAHdJdWJrxZu2muWO9xNbBKrN2P9hggCRalfUiT0bUnbK92x
         BmeXtki9tS3gHgy3CTGTqVowti6ouv21/aFuGH4LgQFj5x+3b/t7pmrwnRv7tp0PMyaa
         jGuz+XdIKNyMeYVC+8kc9+iMT0YfqOhrW+i6/br2GJJujt2JadTbN2oqEQ+3WBavDn7p
         FozOilokPWtusVItQFXg6B7B7f5wKmGbuMYAVtLLuHuhqWBZcK70lHcMX7S2ZQ7upOZT
         LalA==
X-Forwarded-Encrypted: i=1; AJvYcCWYbE95dLoQD95gCr6RYrOCIqrZ9z43jFsvHMOta4K5l7PFVl7Eu94HSi+qQyjHKA7IAXKbodmIIzaJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMDiA58qKSIAGYTcyNlnsmkQw4jJTNblVN6gSGCR1MurwCGwql
	epcFxoyySxwkaIajxtWgImnaEvXzsHQSdoQGiBtvmx/lf5e3+LCYPCn7neU8JTI=
X-Gm-Gg: ASbGncvpuW/sm3mw3+q+XEpfW8P7TpvVkpPJfahHymg2zUNV16N7NZHcMik/h2tLPXw
	mUNEp2OI0rIDfWcTabzaXd5ahstaQ+XUL8RS04BKOyMLJmg/WRzcMZM+/XKydK1XwBDiZQcxlg6
	bx6WdEbC5URvwynp+MqISSklcpXLk9oouCY014WdUPqxZyk9fsY7GaqrRmWge2+rUbbWwIq9DxU
	Doo9ry8vV4fzZxI9FRoLV40TM8QJv8L3Tc1n1zPSncrXOuiyY5FvF9ZphRTITM6vFqyMQ==
X-Google-Smtp-Source: AGHT+IFvdzO8kSsZezoYd253t61OXNyocC0Co1nCFV8wHBoTP+qJCZjUlj51eeP4rMTViQPSd/AEYg==
X-Received: by 2002:a05:620a:6884:b0:7b1:45ac:86b4 with SMTP id af79cd13be357-7be631f51e9mr3472465785a.21.1737575531745;
        Wed, 22 Jan 2025 11:52:11 -0800 (PST)
Received: from bill-the-cat ([189.177.145.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614dacbbsm690566085a.66.2025.01.22.11.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 11:52:10 -0800 (PST)
Date: Wed, 22 Jan 2025 13:52:06 -0600
From: Tom Rini <trini@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-ID: <20250122195206.GA60249@bill-the-cat>
References: <20250122001240.4166460-1-trini@konsulko.com>
 <760d6e6c-ee51-405d-88aa-0def89084778@kernel.org>
 <20250122141708.GL3476@bill-the-cat>
 <17d1708c-e326-468c-941a-1863dfdc946d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17d1708c-e326-468c-941a-1863dfdc946d@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Jan 22, 2025 at 04:08:27PM +0100, Krzysztof Kozlowski wrote:
> On 22/01/2025 15:17, Tom Rini wrote:
> > On Wed, Jan 22, 2025 at 09:36:29AM +0100, Krzysztof Kozlowski wrote:
> >> On 22/01/2025 01:12, Tom Rini wrote:
> >>> Document the ti,omap4-panda-a4 compatible string in the appropriate
> >>> place within the omap family binding file.
> >>
> >> Why? Where is any user of this? Your commit msg should explain this,
> >> because it's not obvious. Obvious is to send binding with the user, but
> >> the second patch is missing.
> > 
> > You were cc'd on
> > https://lore.kernel.org/all/20250121200749.4131923-1-trini@konsulko.com/
> I am cc-ed on 200 patches per day and it means nothing. Do you expect me
> to look for missing user in 1000 patches per week, for every 1000
> patches? Or how does it supposed to work?

Being an overwhelmed maintainer sucks, I really do get that, sorry for
my short reply.

> But regardless, the majority of review is done via patchwork and that
> DTS patch was not in that thread. It's missing.
> 
> You are supposed to send the binding and the user DTS in the same
> patchset. Separate makes little sense in case of kernel.
> 
> If you need the binding for other projects, then of course above changes
> into: always reference the other project submission.

It's fixing a 10 year old regression where the equally viable option is
to just delete the dts file as I'm 99.9% sure no one has even tried
using it in that time.

-- 
Tom

