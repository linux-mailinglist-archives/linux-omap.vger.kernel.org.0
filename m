Return-Path: <linux-omap+bounces-3165-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90860A193C8
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 15:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5A1516B7D6
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 14:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE404213E7B;
	Wed, 22 Jan 2025 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="RWxzg9Xq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7A02135CA
	for <linux-omap@vger.kernel.org>; Wed, 22 Jan 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737555664; cv=none; b=HSqssj28zotF8YVbSKQy0FGita5/niNn+Wk0gc5b7wX5sCwsK9AeKOW4aRbRnQ2JqRaQPABNRyJQFzEbaXZYFELcL0bjlSCxq3V1tlxdJRhIBmxOznQaxHHbsuTvxMuakmmtPHjqYNZ0frutZqrZ6yDsel9yU8xTxI/iK3rrSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737555664; c=relaxed/simple;
	bh=8fwY6kTWqZJP+F8McYMJayWDziJEAZ7kVqsk3l4veEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huAUa6CS7hMZuj5VYZnLD4WJXStpDcDcjedNTITWxVISJRw8/o58wZMpJlrxiP80vh0plAhMQ2vL5mED13QlKEHylTj2pfZSxTvkdPz2fJmg4fIiH+Jp2inVsR6IPQcZxIiGcAzDlXFoSzmMi1EXBgrPcUEDZ4MsdF6GjYljXHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=RWxzg9Xq; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b7041273ddso560721585a.3
        for <linux-omap@vger.kernel.org>; Wed, 22 Jan 2025 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737555662; x=1738160462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Dl3FYX/VwwDw0wkHGCvisbFWwwAgLfF8gWwTxkl9E=;
        b=RWxzg9Xq+osF9mqXYoJ3McGlMtdGC9bz4rs5HygIYEpjOqW8eOBGQCfnMtklHI2sEk
         YvIGXlXNqoekS+WoMmmYUzEGwekj7A8jdXNJe3XoJLxoHV/PXGlvHu3sXYf4enwIKPhX
         FdKO7Hi7WP1w10dr2ivv26YAp7K7tHC49ILwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737555662; x=1738160462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/Dl3FYX/VwwDw0wkHGCvisbFWwwAgLfF8gWwTxkl9E=;
        b=HPLryIXiZJNY0XPO/17zToDczp0gVVy9hPuIx2KNoJznzAfKvl/pDdYcB8YGI1BFgK
         IGsEbhkPyXfY3gLSgYf0j0cJwjUs/Izcy8QFSL/Y4z03i6kt9a/8FD0gU0Htpw3rHHId
         PJ1Jlt8zSZRsk8ABsoieg3BPvPoy4wRFCIzcuNytFSUlCg/3tzQ+XD5HefOjVN0RVLg6
         2yivOiIHCavnR0At2IYcs9zCOoGnmKqLdfy6n7Gsyty2A3GZ4kUk6bdsgwG5i5Ds5dgE
         V/PCiTN0mbXLNuyAkF0UWP69mK0ogUJMMZWj0Eju1FCaI4TdIOc7fDzkhwjtSWXgkYx9
         FJuw==
X-Forwarded-Encrypted: i=1; AJvYcCVcrD95H0fV2VS2giZ90q/TUZSzQ4+trXUoeSbHKP0QVpUrhYdnMw8cYBKpHTtkLB/VQ5+7yyOebZw9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4PVfZc2rQTL4TxjmVLQc+kg3GsI1eo7zNXUynMo4ZuHdsY1/g
	xpJ9eA7h5/pjc/rXutgFHODmaSLK6Wd7V33DCNK8JYBPMtvXEflQACAngbQNRsU=
X-Gm-Gg: ASbGncv3H40p2oWMyPoVzOhWxyLooOwauql+WSaxucXQhxMRag9bZUUavoFjp6wieEr
	JCKg1sz8ne4O4Pb0PyGj3TIV58/DBZhzbwSDd+hsGlHO3e6SvaxWK++Av4yZZqE4gEDIruzBsd9
	NZsUzLOMCGlW8czn3AF5gP8ASdlMosa99obkR58OQtkiXfSHUJfwBkXKgfDa7x5yFPSmjhUU1jr
	nkdsl4C8Cp71uaI9LtymXv5hafHdqzSwz7M7GSK/JIY6TU8OzzdYntOK9su8H5FMaI=
X-Google-Smtp-Source: AGHT+IEausbvjRjRJh6qlOTGxlvHplotZ2vhhvLe3+TnJgyOHPU3fKATDt2iOZTs/FUx7HQWeD6EcA==
X-Received: by 2002:a05:6214:2a4c:b0:6d8:9127:e71e with SMTP id 6a1803df08f44-6e1b224c303mr331206806d6.41.1737555661943;
        Wed, 22 Jan 2025 06:21:01 -0800 (PST)
Received: from bill-the-cat ([187.144.16.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc233ecsm61538926d6.57.2025.01.22.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:21:01 -0800 (PST)
Date: Wed, 22 Jan 2025 08:20:58 -0600
From: Tom Rini <trini@konsulko.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: omap: Add TI Pandaboard A4 variant
Message-ID: <20250122142058.GM3476@bill-the-cat>
References: <20250122001240.4166460-1-trini@konsulko.com>
 <20250122093236.6152c56c@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122093236.6152c56c@akair>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Jan 22, 2025 at 09:32:36AM +0100, Andreas Kemnade wrote:
> Am Tue, 21 Jan 2025 18:12:40 -0600
> schrieb Tom Rini <trini@konsulko.com>:
> 
> > Document the ti,omap4-panda-a4 compatible string in the appropriate
> > place within the omap family binding file.
> > 
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> > Cc: Andreas Kemnade <andreas@kemnade.info>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Roger Quadros <rogerq@kernel.org>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-omap@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > index 93e04a109a12..28e23ca766b4 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > @@ -137,6 +137,7 @@ properties:
> >                - motorola,xyboard-mz609
> >                - motorola,xyboard-mz617
> >                - ti,omap4-panda
> > +              - ti,omap4-panda-a4
> >                - ti,omap4-sdp
> >            - const: ti,omap4430
> >            - const: ti,omap4
> 
> This allows compatible = "ti,omap4-panda-a4", "ti,omap4430", "ti,omap4"
> 
> According to your other patch, you want
> compatible = "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430",
> "ti,omap4"
> 
> so you need a construction similar to the "ti,omap3-beagle-ab4"

Do you mean the order should change, or it should be an enum? I'm not
sure where this is documented (the $id and $schema values in the file
are just 404s so I guess not something to read directly?).

-- 
Tom

