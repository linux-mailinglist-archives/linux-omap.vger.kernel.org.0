Return-Path: <linux-omap+bounces-1585-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B19130CA
	for <lists+linux-omap@lfdr.de>; Sat, 22 Jun 2024 01:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857131C21611
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 23:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537F316F0ED;
	Fri, 21 Jun 2024 23:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSvtMzvW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143016E899;
	Fri, 21 Jun 2024 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719011363; cv=none; b=D+L8rWPrJ1jRp8R7FksjjC1VmWK3HiIYmfUoE6g+RmFpNv1taTo04qtiGCmsqkj2tfxuHe/0HtWpCIh2IPpfgSj3qzPl66itEauX82ptd3o+DkP4lD61pQc2HuAZv0kCWF8Pv1muYx2WveGnrh5WbbZfKzj65Lj5MWTjm5HlrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719011363; c=relaxed/simple;
	bh=eE6wk2WcgUirEjGrFDuCEdYbMtZqyDAgK266lQRZ0aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=moZCQuy88AtgRskaz+3DmEvvTTyFlGv6EbrrZX4TqKKTtUlpCBVUoZAPw71RBvX6MRljPtnQVL7kugLms1aOBrB5N1buiNr5vSJtGI+/CkZonhc3VorTGE+yoY/0wzM2FtvpSWzUL4Wn5BqLCwq0S4FYog3Nvw01Rjfzo3Tns/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSvtMzvW; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4ed083c2874so777887e0c.2;
        Fri, 21 Jun 2024 16:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719011360; x=1719616160; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffVmrRu08ej+BDuHCXTDWvHdM6rvJCW4tQU3Nw8xcMk=;
        b=JSvtMzvWa2LKFHU9u0Jxe62BZA3TXAOoEgdvx1emjHtOHv6YlxU+HmqZ2sIwWUrvbM
         WZ6CAZzDu8jeQgZWvef99zhb0aycBGiqauASnoFilE1/ttYPmZO6hl00gzsRwqJ4XwhC
         pBXFAvwYRHCGaeIhqRP43vbVHMDDvGY8xBIPfLtKWt4OeeDlYEyEIOMRAoG8IN8P8MZI
         YSKsuoACM6UKy7KnAQmx+NUsNY+1ZDYrXYie49FNQrOPG2n+4NIkkUfDKXiZrzfbgin9
         h19BxvBeZfJZ4v4zcGepkPfutC3KPFYWIztHrgPdqcyMSvF1zhf2AUZ7M3Ftwt+UqG7w
         pwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719011360; x=1719616160;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffVmrRu08ej+BDuHCXTDWvHdM6rvJCW4tQU3Nw8xcMk=;
        b=nZkzru43M1DntM3IMzocHQoGU565t55wNNIOj1TidCgJpOpVxCW31IdMSJutagG1PX
         h99SNtfkTgYIjZMAI+w211h+TV1lVKZwx2VE8wmZGPkHuzc3qwS/Br+Rle27SUFIyTF7
         /7X612qT6i4xlTJk/MCL8AsircJ9I+HHu8t5CJEDScsrmHfIcr7CXtQq5VNPwh7NGWaF
         MmbCoj27vi9AZs9DyBN5LvBoAGleR5VF5uDdsIrgLn3vyt8/HFCSCjZdvusBPVsjQIUV
         ujEC7dv7ar/gQqZsJqPxvj7tgEs9dwb5/vVkspoYEIJ8CSbvJDsjVANykF6DJXjzr2yv
         eQgA==
X-Forwarded-Encrypted: i=1; AJvYcCVGqcpiBmtxtiPTDWF+CAfRn/3VaTLxXdCdOYiOYU/VerwtAGh7+GUGXZVFRLl1L1Q+eBP43l5Kslh6BCXPs1qoGNiusv0ZhSarJZRrE2kzhPUQ6GkmtDMcOaAkr0REF22YhHFwdYAXEf2EtcDqlJTXjp8GXvyE86yJq3S3HmpNgoMP6bqkkvOeabt0O0sk59FSkaCtRW8ZTT3fr/uZ4kuCj8UUzyOi
X-Gm-Message-State: AOJu0Yy/0ku8T/06Fy4XnvfMuy9SMlID2UuXny+Y+N+pN7nlyDKJ2ZI+
	5sgy4tT39ZACKc1V7dzwXDMNhKxft3cQkt13XYhBEcC3xZ5LBf8mf33XxchxejLVz4q91oUcaI9
	WjO33dUs14Kh1P8nPPr3mdR/XsDQ=
X-Google-Smtp-Source: AGHT+IESVQ1b8mSEZmU/iC2jwDkrBtMQpwgCegx3ps6DqYKI06zcBCoE0lL/xZmB5gHlyCLozXFF42oe68Km7lhczgg=
X-Received: by 2002:a05:6122:181f:b0:4ef:5b2c:df41 with SMTP id
 71dfb90a1353d-4ef5b2ce485mr1141412e0c.9.1719011360451; Fri, 21 Jun 2024
 16:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618225210.825290-1-allen.lkml@gmail.com> <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
 <CAOMdWS+p4Dt2xDGWvwoXtWinsRZintLwPmADddbsmaEfLvRQkw@mail.gmail.com> <ay2rpumtfxtvx4qgkgal7a7z46dbtwjnq4ctik55neseirkhfk@gkylcwud6vry>
In-Reply-To: <ay2rpumtfxtvx4qgkgal7a7z46dbtwjnq4ctik55neseirkhfk@gkylcwud6vry>
From: Allen <allen.lkml@gmail.com>
Date: Fri, 21 Jun 2024 16:09:08 -0700
Message-ID: <CAOMdWSKzd1nt832+FHtwcMLO1rtgEC99Xz-wvNWGtXiyA8uK7w@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: Convert from tasklet to BH workqueue
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Allen <allen.lkml@gmail.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> > If introducing the pointer is the only way forward and is an
> > acceptable solution,
> > I can send out a draft.
>
> My proposal is that I take over the SDHI part of your series. I know the
> code pretty well and I can test the solution right away. Your draft
> seems in the wrong layer (conceptually, technically it should work), but
> I need to play around a little. Is that okay with you?
>


  Sure, happy to help if needed.

Thanks.

-- 
       - Allen

