Return-Path: <linux-omap+bounces-2369-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B017997B57
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 05:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFFD6B22EBA
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 03:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088EA1925A2;
	Thu, 10 Oct 2024 03:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFPGWokW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3A18E764;
	Thu, 10 Oct 2024 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728531364; cv=none; b=UP6odIssawfaLQsIRMgsyj6PljyCdOgnpWPU3ffCQ2hBTTFTPY3LwsVU6ZElel/ENEkp+t5aA8Tf5vIV+bexwb3VLKE9uSUd0Hx+TQH6LoqsTelwHUXQR3FKdABDuN8+ePW8LsqCsFyRNzC78JyAWPHF5sPgMbRTQdnerSEblXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728531364; c=relaxed/simple;
	bh=5Z9FuWv0EUm5WC1Moxyl8tHtCSQ+LfRMcImNNdJnPNg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=GPz+9F8td6suLtsIWpOewRhSoZ8hbO84J1SqzJGucREZo+cVI3jKHvOMYWxaUTe0QKxtkbO+CaMLyrhgYpUDFHpGXJ8yoamXYfgdotOGn6PTjQeQekd+AJIpyhlyNnWfqSXOkFpF8HsABQqB4fMccQZxEP26Ze1HHfiJz7OLH+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFPGWokW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3425C4CEC6;
	Thu, 10 Oct 2024 03:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728531364;
	bh=5Z9FuWv0EUm5WC1Moxyl8tHtCSQ+LfRMcImNNdJnPNg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EFPGWokWQO/B2v76YCsCbMXmDKTP8wFPL6Je1Ljwe3g/7Ki98BIYkNq6XFkWPEfeW
	 1q4MesTp6tFv6gpGV6KttIcFfqSZVgEOHhUZcA/ngA2G08J2iHOC7h1kX3iqIdrEHr
	 U2tWv9Gf50wydQm4p1yy1gcmdGOF/7B7feoGhUqMIJNrW7etvgz+j+pVjGKvQ5YsH/
	 VXulAjis1BrggaV+xD4Spsf4KN71ZTJo/7h4KQe3VzuaYqciSszzf1gTUpm5M7B16D
	 1I8QsIIWzhL8vEjJOJHbFX7mFXR0C1NEv4zJafTFVmOr4wQ8rcELZKDzFcm/OaiqQA
	 JiRnuuSpD1Fkg==
Date: Wed, 09 Oct 2024 22:36:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20241009205619.16250-3-andreas@kemnade.info>
References: <20241009205619.16250-1-andreas@kemnade.info>
 <20241009205619.16250-3-andreas@kemnade.info>
Message-Id: <172853136314.1329129.6497161876354458336.robh@kernel.org>
Subject: Re: [PATCH RFC v2 2/2] dt-bindings: clock: ti: Convert divider.txt
 to json-schema


On Wed, 09 Oct 2024 22:56:19 +0200, Andreas Kemnade wrote:
> Convert the OMAP divider clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../devicetree/bindings/clock/ti/divider.txt  | 115 ------------
>  .../bindings/clock/ti/ti,divider-clock.yaml   | 175 ++++++++++++++++++
>  2 files changed, 175 insertions(+), 115 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml: ti,dividers: missing type definition

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/clock/ti/composite.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/divider.txt
Documentation/devicetree/bindings/clock/ti/composite.txt: Documentation/devicetree/bindings/clock/ti/divider.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241009205619.16250-3-andreas@kemnade.info

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


