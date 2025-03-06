Return-Path: <linux-omap+bounces-3339-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EDA546B6
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 10:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046B93B259F
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 09:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1665B20A5C6;
	Thu,  6 Mar 2025 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AN24lFao"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B01199935;
	Thu,  6 Mar 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254189; cv=none; b=RlO4kvYHs903/yqjLxS5T+lRmosdgRdsUaJ4KFXKjhIK+2r6HKEjKa0GsdEy5KxzohPYXRAXiPdZKmXxnQScqbwuwvHBBlK3P/occY8ayAQRHTssolWsbX3FnGtRaWTUun2pVJPRbI2qThdatKD2ChO2z2VGNyaK/OZN9HCg9fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254189; c=relaxed/simple;
	bh=pKGp44lRjpNEGvRfTOCaW8rSzZUGZ6Doloz+Riyzld4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdgM3s/R4Oi10mSTftlg8UbhwRavjoG7gZJjwjjmpeSe+9amTDrq47ku6mxgMzlrYBUoiP1/gawcvSt963BGSBf9U+oGuCGsNUZTh117u3+xSLZRKoFAtgzIeqg6Z3m/3HXacQ884PCJvKZJghe+7pG9Y/AySj42VglKYYp/TxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AN24lFao; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA067C4CEE0;
	Thu,  6 Mar 2025 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741254189;
	bh=pKGp44lRjpNEGvRfTOCaW8rSzZUGZ6Doloz+Riyzld4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AN24lFaosPprakzuIxBh+b4X5MXjY02lUqB4Dm99mDgqPiuitee5pfjqS391smZqN
	 wU7/vd8zx4qU+cbbfG0Ne0bmBKNQQfimsnhK96sz7IXtQWtY2egB2/IO0RmEMjYfdY
	 PKPWFS5AHP8ZACpW1qBUWrWBbV19v4momGZkdgZgrp3PZXuGBmBxRWDMQNHmZb33cx
	 GiLryLj2jbLJte4Mc/nU5VeEWQcq8ZXeWWITYtB6S2fYjbxo286JJU/jUbr6kvw/UN
	 I7leOu8Iuco3z9bfCTPcWU6XWgJBBG8+mRbf12ap1uL9AaPJkgvxW0nHcttO2kiPWG
	 Ik5Y5Rfs+RsEA==
Date: Thu, 6 Mar 2025 10:43:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, tony@atomide.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert ti-clkctrl.txt to
 json-schema
Message-ID: <20250306-vehement-garrulous-nuthatch-4f56a6@krzk-bin>
References: <20250305224722.66360-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305224722.66360-1-andreas@kemnade.info>

On Wed, Mar 05, 2025 at 11:47:22PM +0100, Andreas Kemnade wrote:
> Convert the TI clkctrl clock device tree binding to json-schema.

I do not see conversion here - old TXT?

Best regards,
Krzysztof


