Return-Path: <linux-omap+bounces-2303-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B998FDCB
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6821C21E32
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 07:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAED137903;
	Fri,  4 Oct 2024 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlmJXMVZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9769D2B;
	Fri,  4 Oct 2024 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026735; cv=none; b=d1rg5aQnDIBCyEojYyYn4Ynbk8afnheAFZG9SjoTPblzFfWK788574Oc4AFx7rU4ClnbR34y7adu8QDRgVcG4uUyvwnbvRWYdyvOyIaA4mxYLp6xfV72+tPBweCbG+4QhtLyYS8/BMqpr1bVXUuMcao0cjMIuBEgpSMBbvJ1/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026735; c=relaxed/simple;
	bh=xNfejlh8XzHSHTAFLtN4lCwtNkypHdytUiDxiKP7+xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wtd7VbURKfGZg6D5WLsk9Uyk4GU9Z2AI5PXIPwcTTR3b/Zn7IU8on0QH9Mav7UsRca0O03/q69pl/stZQdTbPSrA0M/9Zx7b8fyj9PCs/8un+jJ3zNFPIHShaycW6y0ExwMcTEgTrDGHd3uV5igJATRnciH4mnSKmR4oyhPzLeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlmJXMVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF461C4CEC6;
	Fri,  4 Oct 2024 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728026735;
	bh=xNfejlh8XzHSHTAFLtN4lCwtNkypHdytUiDxiKP7+xc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=IlmJXMVZNxCbT/pJjXxAUS4X+2DHhFX8NZLJuFWzHTlFvMRxYTD+jgwHxELu8cXfb
	 MrtFpAJG7H5yWTvLnZztuFM9HVA2c9SRsRmMAu46hgg/EAfbsruGTcEU3p/o6QoutT
	 WxuRQ73GLR8ezZXJNW+a+fBeq90Mk0toqLBjX0I3xRfI3Ra6+uj9xeAyqjWFoybnyG
	 FR/7mTH+e5m92H3dRkThEFPrQD5lLMYGYSTBkdy/jjIkAqqHQPwwAxoQdOjg54JSv9
	 /70TXm4ToCtfdSrs0LBFSraRtVT6D6rQ89BXfhbzt2NCZjDcct1Osk/JiPoO7VJIMt
	 09V27kZW5iWuA==
Message-ID: <7b183e8c-6ca9-447e-a514-63044c389359@kernel.org>
Date: Fri, 4 Oct 2024 10:25:30 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up
 regulators
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 khilman@baylibre.com, devicetree@vger.kernel.org, tony@atomide.com,
 aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
References: <20240930213008.159647-1-andreas@kemnade.info>
 <20240930213008.159647-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240930213008.159647-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/10/2024 00:30, Andreas Kemnade wrote:
> Wire up the regulators where usage is plausible. Do not
> wire them if purpose/usage is unclear like 5V for
> many things requiring lower voltages.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

