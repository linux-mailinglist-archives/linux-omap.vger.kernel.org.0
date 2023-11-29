Return-Path: <linux-omap+bounces-63-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A377FD3BA
	for <lists+linux-omap@lfdr.de>; Wed, 29 Nov 2023 11:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D451C20DB2
	for <lists+linux-omap@lfdr.de>; Wed, 29 Nov 2023 10:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE83199BD;
	Wed, 29 Nov 2023 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="qStEwad/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A8510C7;
	Wed, 29 Nov 2023 02:12:59 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 8830B603F4;
	Wed, 29 Nov 2023 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701252778;
	bh=kFUarNKDlqDSpl/U8/e1n11XHnBUqLk96wjayppBZw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qStEwad/kZ7owqPHlhNKu2EyvBEpUPG/O11tV4lM9EW6E4Q1YGdtdZtkSrOujWCzp
	 9CtaV/ijIy2ZyheSz50ckYjPjXGOVKZH4mFm14wSooL+0Nh73NeEpGctN/sxnsXohU
	 6qZ7RHBFYgQAqf9N5usTZWP3w3pX1Lx1AXmObjrMAxBZfL5PsPOM/8p+h+aUpZsED8
	 ZEFA52VbgIpRZN0syT36JYBOEJwOC0yiGqrOYaTJw7xFHSXknfhNHdcCjchIPwAztG
	 iyfKNvRM4thb65lDlTUmUE2KHeK72CGuzYl5sqUJcAWHkt+lOJ9DjH2duLnqxD1I36
	 YqJez7UFFIjmQ==
Date: Wed, 29 Nov 2023 12:12:33 +0200
From: Tony Lindgren <tony@atomide.com>
To: Rob Herring <robh@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, mturquette@baylibre.com,
	sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, kristo@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Message-ID: <20231129101233.GV5169@atomide.com>
References: <20231127202359.145778-1-andreas@kemnade.info>
 <20231128171647.GA3343123-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128171647.GA3343123-robh@kernel.org>

* Rob Herring <robh@kernel.org> [231128 17:16]:
>    1341 ['ti,clkctrl']

Are the 1341 ti,clkctrl warnings node name underscore warnings?

If so I think I have a patch already for some of those that I need
to dig up and finish..

Regadrs,

Tony

