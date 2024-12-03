Return-Path: <linux-omap+bounces-2757-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DFF9E1456
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 08:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B90C81623F3
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 07:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D118B189F45;
	Tue,  3 Dec 2024 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOdwXzQ2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC882500BD;
	Tue,  3 Dec 2024 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211311; cv=none; b=emCfWUrMDigXtNDyxTLrY+f2n4rooVCkjxEpkhGAOr3IhVZahYdPG5sIr4VZ0EMHIg1tyG03D5VkP40v7gGAkU6DfrQLbc/bUkRFtYKGzSCtd+VRx2aRm+rCj8NRVHw8L4f8K/oPjNfo30Y5Yj0uUqHPQzuP/xPeXxTBlGX19K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211311; c=relaxed/simple;
	bh=ypnPxAFE2fhbzwzfe1LjgidD7AjC20QK8t5DD9iGi8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxeI8BaClFfIPadc/wuJH5ZBaNwm7PG2lS1Q2uVcEqDmjjje9wEKrKWMBE1GHeXat6RjX2ZEP1plmEdJrjnOaZBuHuz1wuOb9dZeUbC51owPGSgcd4Qzhe3LNzQ4aNFujSmRZr32SoGO37RQKMyzurPaoIGuQPBRPh5eGmeO+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOdwXzQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61661C4CECF;
	Tue,  3 Dec 2024 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211311;
	bh=ypnPxAFE2fhbzwzfe1LjgidD7AjC20QK8t5DD9iGi8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOdwXzQ2yFb70zgcAsTxHKDF674yjrz/bxd3oNv3NHcFW39DUbCTOV4Bh3oaFNL/u
	 1xLH6G+pcwcHuFybzsJ8PR5+7tbfLW7XmHOnemZP6eLQ2wGnZ5jIuuYeBlO3xUXM5/
	 bFbDlgYNUjeHXobKQS5PnG7wIWH98dd224HcoVKyio4JNd3EfUC2y7+emNYVO4ItMF
	 +UzTqXKNqj+80N7XabwENPPMA4LqheN3DVgfKs2AKzl0yDKhkYTItuMy18aDPNihUE
	 apmT8ksG/lxG9T5TgFGQjcrO42c25FsUd6DZm7NkeAqEvVtYGywm/jfGlqA4p7LIWL
	 QLq6MnsPeyYYA==
Date: Tue, 3 Dec 2024 08:35:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	kristo@kernel.org, vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <douamjn7udsmbcouplhgg4i3drq5ayltraorgr43sb4lxwy2sj@gd4t3oy4rg5f>
References: <20241202143331.126800-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202143331.126800-1-romain.naour@smile.fr>

On Mon, Dec 02, 2024 at 03:33:30PM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


