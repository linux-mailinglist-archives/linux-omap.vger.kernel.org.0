Return-Path: <linux-omap+bounces-1241-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 798378AE724
	for <lists+linux-omap@lfdr.de>; Tue, 23 Apr 2024 14:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BABBDB22247
	for <lists+linux-omap@lfdr.de>; Tue, 23 Apr 2024 12:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7213512D777;
	Tue, 23 Apr 2024 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="vdqtVQuZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27EC86AE6
	for <linux-omap@vger.kernel.org>; Tue, 23 Apr 2024 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877077; cv=none; b=oj/aFBeIcyu47+mB+b6dcFB5xRSLuwp1OUC6KaNOdPsnKXi/F7iXJTofNM3ollcJXgeOFyksDFAlFqaH7UjT4kYe66BZ6sNexgvm52msjD2gQ285+tiyTrRs/X2HVio5uh5nwhZmDkUQAcjKUc0syY1hs+mANTO9SVEiIEVxTak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877077; c=relaxed/simple;
	bh=gbFgDHYOBjwAfydbjKzLfsqSEneKrhMKkq47E7/9+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2O9Pp974tRQ56hvy8HDCBWzE9XY2lr+Iab6FUoAarXBv5HerZ0oE8Aq5kbnjQBoGa6KAbMQ082fMcShPlV8t9/HhtZg16deMV0sOph3J0r5NRF2wmh++/4MznHQhIlCtzUOUTwDjGmgVuB0gU4AsJj8c/Z+fG3bgNCBMp5Mdo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=vdqtVQuZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso8458903a12.1
        for <linux-omap@vger.kernel.org>; Tue, 23 Apr 2024 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1713877074; x=1714481874; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gbFgDHYOBjwAfydbjKzLfsqSEneKrhMKkq47E7/9+Js=;
        b=vdqtVQuZD9tFB9h0Nfz7aHsrwc9rvtODwHmbPDKo4vg+R3yiOf+2zue38azPuFLEkb
         JNfy1aUwgnBUBQMre3s+pZMcPTpxEhGFXxwIFoYRrEihme5xH38fKRPHziZxVOiPEcFc
         FKpjcIfwql8ht+MgwhpYe9IAtIPZfwyBbcw3+R5PBTcODc+ZXBr290piPQIJG9fu9clf
         8dClUZeGWzsclaVvKmzqYbID4Hxq0xP8yjjbjkfWz/CaB3TRO4MhtsJSm8PrOevFe5jR
         CBeN6lAuC4NneN5kU6l02BXv8XtuTsxY+wdWKIy9OVpAHpUi9TiNwaW4xgV/L1lbupZz
         fyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877074; x=1714481874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbFgDHYOBjwAfydbjKzLfsqSEneKrhMKkq47E7/9+Js=;
        b=m30NSu3281M7nbRP/63o2RQwmVV9yUYQ+h0LNQKkh8bj6+hDnmyT+1ukpsX02WqqM7
         eRPGdFePZSBYExMkmaJaGscT/oUB/ULFP6Golk4cuN5d1Bz31IWvypY36i7p5MkCewC2
         LDxxF043ZIO1/XXfp7jxEURynDENnp5V9LVtqSAY4rJqRDuGirR/LKS2heS4kOZ/87mS
         aiofdVet8zA26Ch65n4BFdIW1aWI15zBmGNfBAgszCblD8LcZnYnEfUrtje1NvedQRa/
         F9I7l/0FN1ILliITckLOlryQQ+L8Pkcz+54QdS5ekNPrcm/zs9nz+6otRgA6OtW8RyOU
         RPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdYr7nb0KN26wCn9K35erIouOuCVXtcI3pC6830CI319tp3MH6NQDciQIr+ipVPtkFeSy959nVYAYgM4mXx+e03x2A1xewFzdkhQ==
X-Gm-Message-State: AOJu0YyKAm+uTRS2pS9alorYx+T+PiOGLyAZvm6u2JFT1n0QAaJSSUiQ
	EpmCn5woPRqI9OSWAMmxwUkfAm6zTE5YX6YXjFWpfYlbn1K4zvvX0fIXO14J45E=
X-Google-Smtp-Source: AGHT+IFySFld+JzBlc/qIbMllcHbAhPwGnkEfsEEOeb+myQHVp2LmwKN0wccqMzwrKNJyY3qCzWuBw==
X-Received: by 2002:a17:906:b752:b0:a58:771c:1a93 with SMTP id fx18-20020a170906b75200b00a58771c1a93mr1707687ejb.45.1713877073741;
        Tue, 23 Apr 2024 05:57:53 -0700 (PDT)
Received: from localhost (78-80-105-131.customers.tmcz.cz. [78.80.105.131])
        by smtp.gmail.com with ESMTPSA id q26-20020a1709066b1a00b00a53c746b499sm6996080ejr.137.2024.04.23.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:57:53 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:57:51 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: =?iso-8859-1?Q?Asbj=F8rn_Sloth_T=F8nnesen?= <ast@fiberby.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw: flower: validate
 control flags
Message-ID: <ZiewT6N2fjhFwrpW@nanopsycho>
References: <20240422152656.175627-1-ast@fiberby.net>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422152656.175627-1-ast@fiberby.net>

Mon, Apr 22, 2024 at 05:26:55PM CEST, ast@fiberby.net wrote:
>This driver currently doesn't support any control flags.
>
>Use flow_rule_match_has_control_flags() to check for control flags,
>such as can be set through `tc flower ... ip_flags frag`.
>
>In case any control flags are masked, flow_rule_match_has_control_flags()
>sets a NL extended error message, and we return -EOPNOTSUPP.
>
>Only compile-tested.
>
>Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Next time, could you please bundle similar/related patches into
a patchset?
Thanks!

