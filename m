Return-Path: <linux-omap+bounces-2974-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF1A01604
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 17:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A01D03A406A
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 16:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38D71B5EB5;
	Sat,  4 Jan 2025 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR1jBao0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804D14409;
	Sat,  4 Jan 2025 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736009930; cv=none; b=LgahI90mdJPSfLpPEM4aDU0GcFsNOJDC5OT8zmqUhqD6WjkVA8yMe3tZmatvdlLjnmvDUjus3dtAFcrlDRKjkJwS0s5TpL+gXJEZMX5OJJCL6fCN+913eZnF4LD4og+rz9xhRRD2fJdkXAHSWa3+8eLSbwfamMmKF+t+zhglAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736009930; c=relaxed/simple;
	bh=vl0ZkWIa06zvoaPX2y0xapu7SDRBC4ztJWKFUQYgh8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WWMC/J/Dz6a8U1YfXOdkigoJvv3gPAgdWRI8gLmAbcUboZAZFYp1Jxgi5KSbMWnQ9EjAy7c5X93FFGxZgNR0pCOJCK+qgitKHULcKvecwJs/avuR/YUwJrtM66iTGKF++slLZ9iw5FKH9HK5pkoDP/8mNrEXnEvH+J0ZQPRY/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR1jBao0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830C3C4CED1;
	Sat,  4 Jan 2025 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736009929;
	bh=vl0ZkWIa06zvoaPX2y0xapu7SDRBC4ztJWKFUQYgh8Q=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OR1jBao0T8t8+1k+Hci/YBEM3h9W1FvbSx6cdCY3Jf41xy7E2nqYT+40Dj0c0g+IE
	 0KjqQPOK50JKjfLe1fn7/PvUa0iU87+DjjlZ/IFK0qHJd+45EDd8yHvBV7axzcYZs2
	 2BV7aZFejsrxF7iW/jbRBkYR61V/lKJ/xMXzsx0KQskTWar72NcVTuvJot+/sM54e2
	 k5WrcEFKBmIL6WtPTfPPvBurs6QCxswzfoLq57hIJCkcktiQShbMGGGZMmSinByWV9
	 MdW5SFLbfUpNuj3Tse6+SZezOmlxTFCvNQ5hPIjQwYTKaEqwuVmcRFhLBWPBzNWYgj
	 liIfpoKNp5hIQ==
Message-ID: <675d0e83-6764-4d25-bb86-a1078b991fcc@kernel.org>
Date: Sat, 4 Jan 2025 18:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable charger of TWL603X
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 khilman@baylibre.com, tony@atomide.com, linux@armlinux.org.uk,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241229144459.9742-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241229144459.9742-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/12/2024 16:44, Andreas Kemnade wrote:
> Enable the newly-added charger of TWL603X in the defconfig since it is
> used by the Epson Moverio BT200.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


