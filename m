Return-Path: <linux-omap+bounces-2868-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96C9F9439
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 15:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545B416AE95
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 14:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DB7216385;
	Fri, 20 Dec 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpOacld7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D71C4A05;
	Fri, 20 Dec 2024 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734704721; cv=none; b=Zi71O8uacpWKDCkEjnJajAVUMqHjvY7pJ8y4UPcLIaizXVTPVcwxtCF27sPi5NtOOiU9qjg8usVq6OJBsPDDXDT6RwYLZYOS08xiGoKu3wDvKhu/sw4zW79iVE95NVLixvjHoH3LT9thj6kI4GqGc5Bc/PYnrwWgbG1HUIeqOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734704721; c=relaxed/simple;
	bh=m2k3aKNWaioGEZ8eGujKc1PLxx/sna/541BCbWknd/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGrDmgrZZBEsDkJYlnCyFIsQQibJl3ESSeO4Ldcwi2yiti4hGrrk9fa4eBAibToRqB3Yp3HWkUiQepEXea9ipPOXFBdVQAwB/CkukrsXeo93Hx/OOiqVjaExVeA5IWXzXaWRLvL5LgCL3idY18zhg6tFKdmQQLfnr540qHqYPAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpOacld7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC09C4CECD;
	Fri, 20 Dec 2024 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734704721;
	bh=m2k3aKNWaioGEZ8eGujKc1PLxx/sna/541BCbWknd/E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SpOacld76RaFpFCyE9xO6m31w2V6mHouXIaW0EyXA6TI8jLYpdfmp1VZqqLyPoWU8
	 PmRfkYWu3L0hdv8HgHlzaIQuew31LyKHsY5xSXPDWc9Tduy2ZabhZRR1MVOO0sAmGB
	 AKH/vB6zkcBHkyw4I+vVB8jlXhbemuzE7dx6X1pDbMXtX909DWehospQHVQSyN18ic
	 Rq/PbKBwpmUXKCRnQ4oPM2zl/7ocJUQAsiNU/1LlCJbZdBYZyjFHDw9ceXj/FfWlBs
	 wWMJK6dDCIND+0tICXXMsKDfO3aS/bgmePxxsuww/pzjVPZAr7ibWcGHfqH7hPOFt/
	 moZbYmsUiOw8A==
Date: Fri, 20 Dec 2024 06:25:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, tony@atomide.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, pabeni@redhat.com, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: add and use phy_disable_eee
Message-ID: <20241220062519.63d35267@kernel.org>
In-Reply-To: <072064ab-50d2-4517-97df-73acd9262103@lunn.ch>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
	<173466543676.2462446.11795736705448322037.git-patchwork-notify@kernel.org>
	<7128fc70-895d-4622-b12c-eab2475e3049@gmail.com>
	<072064ab-50d2-4517-97df-73acd9262103@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Dec 2024 09:40:38 +0100 Andrew Lunn wrote:
> > Patch 3 is marked "not applicable" in patchwork and didn't make it to n=
et-next.
> > Any issue with this patch? =20
>=20
> Maybe Jakub wants you to submit it to the TI DT Maintainer? Or get an
> Acked-by: from said Maintainer.

Indeed, we got screamed at once for applying dts changes.
I filter them out now =F0=9F=A4=B7=EF=B8=8F Sorry for not letting you know.

