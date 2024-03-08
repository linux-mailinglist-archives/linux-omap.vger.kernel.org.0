Return-Path: <linux-omap+bounces-869-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D3876A73
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 19:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF3C1F219FC
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 18:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075B55102A;
	Fri,  8 Mar 2024 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaUcJNRq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276F19BDC;
	Fri,  8 Mar 2024 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921191; cv=none; b=oRv7KlBPgeQec/CvKMU8u4qj9BLXL4o50q7y/IV9Vi6SbrFxHgy1RkfSPm4TemtWICtNJuqdF/yCucjw4XMHnQZSJ7kGjyqj0j4+wNTzJdyGX64WCzrzse+ZiTlc8IB3F020Sw02as8/NKxP22WWnapH6sPHgwuRIZs4t0jqWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921191; c=relaxed/simple;
	bh=HklvlbNKtDuuq0UHInjzv9d8PAGVxsP5M7610l7WjtM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZppkPU3WCqMLVwx4Uc2d9ogvy/HibQ2COSBRkqQz/xHV0oh67dMDJIE7c17BWxLbBocs3Xwk4gQs7X6pXYy3xRX3ZYeWpVtRbTWM/0mHisYNmAkvJDh55Rv9bY5Ou9K05vZy8ze+NSsZyjF+htqpRBzTAMc1mupj/MV0aqZYIlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaUcJNRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57CAC433C7;
	Fri,  8 Mar 2024 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709921191;
	bh=HklvlbNKtDuuq0UHInjzv9d8PAGVxsP5M7610l7WjtM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LaUcJNRqYZ8ehDyXZCKHO7t7FjB+ttYBAMhOBNmBoCvASW1on8Y2LcwPUCK7ATKi1
	 IG64z/TO4HwuNk/rK9TA+FRYF0LHBEUUEqrjR/E1qI3/WOA4msT4R5KqoAPBnk5kSw
	 7KLDoN9XxfY3QvHZ+3Hvv7mEJC2Z/IOvkBWFKOMxmubmZdTaXR5K15TsQ9wpW2OecO
	 oOaxmCxu1/leXyavEUw7/OY6mHCaavQysxAQY43OenCQW6I6I4+5vMDN+w4NPF3kNd
	 IkZyU74NlR0w4D5KXgzkt5pEoEHOv3zwbShqHr1phxKZkYhEFBzBehYXDR8yCsvIj8
	 ELtcN8aDucUAg==
Date: Fri, 8 Mar 2024 10:06:30 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
Message-ID: <20240308100630.456498c4@kernel.org>
In-Reply-To: <202403090150.0gkUdeIc-lkp@intel.com>
References: <202403090150.0gkUdeIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 09 Mar 2024 01:52:56 +0800 kernel test robot wrote:
> |-- i386-randconfig-141-20240308
> |   `-- drivers-net-ethernet-intel-i40e-i40e_main.c-i40e_veb_release()-error:uninitialized-symbol-vsi-.

Hi Tony!

Is this one on your radar? I suspect netdev@ gets CCed on the reports
because of it.

