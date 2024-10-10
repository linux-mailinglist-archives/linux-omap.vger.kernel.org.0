Return-Path: <linux-omap+bounces-2394-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDE999356
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 22:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D49DBB22C57
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 20:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442A01CF5D6;
	Thu, 10 Oct 2024 20:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRewA6hE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634D188A08;
	Thu, 10 Oct 2024 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728590878; cv=none; b=gxhdWoNdK1s009MKLF5sE0ncM43fd9RmHn61oSKkw3WPItqHMRdLzH2n1q9st/Nlb06zxXDJ6dG3yAGe6Tz7ebtMpoJdxh1RK9KhlSQ6ueRv6H68yHCfL7gStTD4PbOs2q+tztqwoUhgJV4Qsj1CFQo6V9Ln6EP26XThQxEX/ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728590878; c=relaxed/simple;
	bh=0phsTyjpOwDZbBXdW54JjZ1NBz6FHqPX0ZlO6gvs2rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gL/Bj3HOAc+2d/RtFuFDwBm5YqJ+Jfuj/XO8fdv60FQZwXZfhzbizUJmNhxLNFP8BUsbN/S4IMfMPsLVQIdiM/cH8TgQ1nd5wc09avc2TnIVUpNopwnEof+5dpAFfMhBxEv4vz5MjOBjet2sxKMFsAuWEWoc81I1WcE5YlHR5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRewA6hE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAEDC4CEC5;
	Thu, 10 Oct 2024 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728590878;
	bh=0phsTyjpOwDZbBXdW54JjZ1NBz6FHqPX0ZlO6gvs2rs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=sRewA6hEWyFQsL1NDSRe9IQqgFqaBtOrLU0FhZjRkYSeZdWssP1TqLNzjmeyF9WLe
	 GAqFguFUklghRgWZgHbviQpoPHms+VSvuVqpXQQypM0ypcGg87NQmyIbkKvsVyIAO4
	 pkPerUwQlVARpbL7W4HIh/aHlOoRZroOP0Ou+OBMU6ceHXNOk4hiVrZ5laKgmmdQq/
	 JrGeZGLayKtwZtHlddK9BslWmqDnqbE4+kfnyD9BZqhKUD+8P9Z5OmXxcE2sv41Lk6
	 YNQAsUpc6wY2vW/nB0sUlFsAu5IcLBIcwDDYKG4ct618Gi4gDjZ7mRBIQqOjMW9LVF
	 01dHngUNaXwGA==
Message-ID: <7cc6e843-bf91-4289-a09a-f4e39f712600@kernel.org>
Date: Thu, 10 Oct 2024 23:07:53 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: omap: omap4-epson-embt2ws: define GPIO
 regulators
To: Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, tony@atomide.com,
 devicetree@vger.kernel.org, khilman@baylibre.com,
 Conor Dooley <conor+dt@kernel.org>, aaro.koskinen@iki.fi
References: <20241010122957.85164-1-andreas@kemnade.info>
 <20241010122957.85164-2-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010122957.85164-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2024 15:29, Andreas Kemnade wrote:
> To properly have things running after cold boot, define
> GPIO regulators. Naming is based on board file.
> 
> In the vendor kernel they are enabled in a function
> called bt2ws_dcdc_init() if the system is not booted just
> to charge the battery.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

