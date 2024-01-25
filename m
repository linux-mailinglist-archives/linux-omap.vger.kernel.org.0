Return-Path: <linux-omap+bounces-377-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F119983D081
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jan 2024 00:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2DF8290ADD
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 23:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A587A1759E;
	Thu, 25 Jan 2024 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsSCs86a"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3659171C9
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224737; cv=none; b=dKH+ZsBJi6p7hW56ZzEneRLzDM/wZfP1ceoimMmyGnv5YSfxCiotiqJMbdmEFQlNKwVhxzZLn/xDi+WOnl0KtsZOI/KAhQrYik4rpTWPRmXHQTrJnaXWez56Sbw7nSjB7O5p3wGHzFQBXJCewBTYDdonRNHgbev/81FOFDk9EHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224737; c=relaxed/simple;
	bh=7uvqzJiFOH7CqK9D/XE9qIcs6f8P8aqvGseDf75yXXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmwMjZXCuXUUTNzWrfYEOcidBhVA20m1wGv4X6ePRLx//agyXhdAQ1EqUpK3nYViHfLgr3ekzEOcc/IXGweim/cY5AsBBhPcvHCCTE2dzDd9j0aAXWx6uI3zbPvjANzMeMLKFJbFPkwKdew1f1AmqNiLryJ5MV0n/7/lrt05SRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsSCs86a; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff828b93f0so67420817b3.3
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 15:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224734; x=1706829534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uvqzJiFOH7CqK9D/XE9qIcs6f8P8aqvGseDf75yXXM=;
        b=ZsSCs86a/S2lz8chareQY9wVV7h/sZwKG7z3FaRYk2qI7Plqd1cVedCVgy07OdHtrU
         X823lr3pENXGI3wijqr7ejCytYOwlL1+WZkhRm4sIDQKWJYlOP9rCm4Jc5eWvzfTW/ox
         Rxvh5eh1BJv+5PqtvNdEZ5Xk0zQxmLUnTQZ9efZGubshZFTVIGAFJkOMKCW5vbVxzH4y
         ZmkL2gazF3rb9ejhMOw5D1B4TW1zRu28+bsv+fwyq8uyrhHEDrWJmF+J1ETDArQYkkKW
         BtpnPhBRf7GnX2ju0BQPIm+r8F3HZ1KNuddnuiwRSbB9/U08aNnLjQZW3RbRT6mFVSgp
         ty4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224734; x=1706829534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uvqzJiFOH7CqK9D/XE9qIcs6f8P8aqvGseDf75yXXM=;
        b=iewR7PUMQWVOtoeoCNvBI6sEBBYtCLr3rp+ap0jamx2KhCPmXAz8hfxhI/Qr/cjmV+
         6+y8otiMy4edJqn+BiTis8yN3VuOm0Lw86Q+0unRZONqPsn0+VBJnAZBHfRByESFcRO6
         CjCtMltAhmJN0u3TfF5rpuOIg6cq5WtL7Hr1DDH9GuVvUXOnd0DiJ3IClzMnYlrr2GPN
         nH2wuwKqX1bFRI9EkUoGSvwZawEHryp4aMsS3lW8zFCxJfbTFeWtToRcfJPo7qV64K8/
         +Q5LtOzuLxjUdlo4TBD01h6ThGb9yqtSsXzNOvJ+30gtkJtqr5DpLmbyXh9YpTq2Tmik
         6GtQ==
X-Gm-Message-State: AOJu0YxZbLcjdnvjyDx2aGYojCFR5nE1g0ClDZtmlkKx2mYmhX4cVyCO
	1KV7T6lnjWFiY/Y6csLTL5C8I3F6hZ/KvYfmcG/Clo2wptSrNiHe/5bc9LlaxM5FIKzhUtwOR+S
	ok8leZjwoicYa30nW7DHtcE24bI9rjcSMSu05Gg==
X-Google-Smtp-Source: AGHT+IGYkPRYDSlscKRk4G+SfhQLgKGn3yOaS30O2gXXD5Tt9NYFdgvgNJQJQsN4IwIhaD5odaQS198rhu6R/5DbH+Y=
X-Received: by 2002:a81:aa4c:0:b0:5ff:35f1:714b with SMTP id
 z12-20020a81aa4c000000b005ff35f1714bmr601737ywk.12.1706224734637; Thu, 25 Jan
 2024 15:18:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
 <20240125-mmc-proper-kmap-v1-1-ba953c1ac3f9@linaro.org> <7ca13324-ac47-4648-9b3c-c616de515625@app.fastmail.com>
In-Reply-To: <7ca13324-ac47-4648-9b3c-c616de515625@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jan 2024 00:18:43 +0100
Message-ID: <CACRpkdZWrRCoG_HL4WxpcauP_ipvfekg3j67fUHewUuMxGzBeA@mail.gmail.com>
Subject: Re: [PATCH 1/7] mmc: davinci_mmc: Map the virtual page for PIO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>, 
	Angelo Dureghello <angelo.dureghello@timesys.com>, 
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, linux-block@vger.kernel.org, 
	Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 5:37=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> I think to do this properly, the driver would have to
> use struct sg_mapping_iter like the cb710 driver does,
> but the conversion is not as simple as your patch here.

Ack, how typical, so that is what I write in the cover letter
that I wanted to avoid but it seems there is no avoiding it then.

It's a bit trickier but I guess I can pull it off, it better get some
testing.

Thanks Arnd!

Yours,
Linus Walleij

