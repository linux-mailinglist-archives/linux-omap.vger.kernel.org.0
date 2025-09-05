Return-Path: <linux-omap+bounces-4581-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E1B46572
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 23:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73C697BAF1D
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 21:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BE32EFD82;
	Fri,  5 Sep 2025 21:23:46 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395FB28137A
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757107425; cv=none; b=e65/gwxG5BfxJxl9z5lQArfF8mmli2ukr5AAdcGf/eo1jxn5or3PJLNXOkKbI4wNSYPilbRY+VGNX+3VdjBkwghi/UF6Xj1f4n/fSSsz6GZKMOG7Z9shjtBBnJabjSD5hRnY0qWeYybubCL4fIUpHF9E/IEmqEfUxyq12JhHUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757107425; c=relaxed/simple;
	bh=o/PqQhK0PKkxH5IBGjaZ5xFiBra8PzKV7+1t1tFVm/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lnO5C6NZaKO5owBnBrkg9mOFZASYeRmoSPto4+FJpy/IIMPsPaHOSyK4q4xIO2uh9aV8kjzaQUhrQP8uJqfh0EEKjKEGfSV8wCwbpcnuadsfVKS7/pHvonK8npW4S0pSdAXKl41x3RZf91DLwIf5jXv5cFV5qHEfk1kZ6z2vJ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77251d7cca6so2183065b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 14:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757107423; x=1757712223;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6wZ9HgdgMtQgRD7Hr86g025jE/p6E3Wse2CcjqMIiw=;
        b=uTNyrDU8lsWGEKj7KAOGkVaZ6j6OgErSB7UIpHuno3lxEJZM1JJ0+qE+l0DesmghbY
         LWKMTVs/rnkdM38DNR9SPvXZyUPIC8UzuH9is6hcju780icNrTD+6rboKcp9TicHqCNy
         Orp8zweiK54Nf899XeSM8wcYW1LvjmMsK7O+rgvVkn0w2hsx6Xn3gEhz7+ewf2+vpijN
         PBQH3qm1n7KKY4FsmXG5QLRyiAgVLfC0l+r51k4+8sAu65rPQHQCk38CErIB8wqS4dWO
         a/0Aon0Cjt/2AxcKpNbF/k59sgFhip3/PXDyIepg9uDJlmzHtDM+2yweZrS6D5q1E3ao
         cZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7kJEqq5zb/RaqVOWf7jsOSS99cRSGajY43B2jLlo03TZCqn12ZAJEh1p5fRMMm33Tq4Bk3q+1ZqDD@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIL9CqV3mZCEK/tiPXxALFmo5EXJws9fg/LwoawTSPzDXzMr2
	+7pSqxuSxa+UEpjjplUtg21aeolMXG6dyyzW4YRc7umBercCHH06MjwVZ8BZqzH9PWw=
X-Gm-Gg: ASbGncuH5UpndgOI/Xa0NSXrjDXBjpsU9ky06CSMVc60EH5GbZkyboGLA1tVJ/hd8dS
	fXHtda1CSqFb6MI4muNoCBrT63PG2JUsCG31Izyl2I9R1XiFPEX+agBxnOsr8qcU8dlzJDVdHEp
	YPjAw8iVMhOyKTWh1lFSeHQKE/Rft2iZ2DaFYmTh1ejCs+7Q2KCbCsU6aCcAyfJ99nFfrZbs27y
	lJz3S5gZqd5v2WYvDq407SGEFcjfcijQ7IZAo6MDJbf0WYa+TWMS/1mHRLwESe7ggVVz+6gQeYi
	xNsZ+PKQDx1zGnW4pA4GEwkzAVMzCNBaTJqwcn1ycvu+f+4oMvU++BLbecUxhLQm4VIN4WX8bgp
	Fl+HNX8Me8j8SfiVPgHh1
X-Google-Smtp-Source: AGHT+IECEsSQkwfBCZIu4aCVdg/6xbbfhAHy0KA5ITM5kpE6xl3JxGGtEoATFjZl9SBoRxWqA+Li6A==
X-Received: by 2002:a05:6a20:3d89:b0:246:f1:bec3 with SMTP id adf61e73a8af0-25344415094mr362891637.42.1757107423576;
        Fri, 05 Sep 2025 14:23:43 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bf561sm23001252b3a.59.2025.09.05.14.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:23:43 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, Brian Masney <bmasney@redhat.com>
Cc: Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: ti: convert from clk round_rate() to
 determine_rate()
In-Reply-To: <20250814094527.29745592@akair>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
 <20250814094527.29745592@akair>
Date: Fri, 05 Sep 2025 14:23:42 -0700
Message-ID: <7hseh0a90h.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Am Mon, 11 Aug 2025 08:48:05 -0400
> schrieb Brian Masney <bmasney@redhat.com>:
>
>> The round_rate() clk ops is deprecated in the clk framework in favor
>> of the determine_rate() clk ops. The first two patches in this series
>> drops the round_rate() function since a determine_rate() function is
>> already implemented. The remaining patches convert the drivers using
>> the Coccinelle semantic patch posted below. I did a few minor cosmetic
>> cleanups of the code in a few cases.
>> 
>> I want to call out the changes to the dpll driver since a fair number
>> of changes had to be done outside of Coccinelle. I unfortunately don't
>> have this particular hardware on hand, so I was not able to test it.
>> I broke the changes to this driver up into smaller chunks to make it
>> easier to review.
>> 
> Tested-by: Anddreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04, OMAP4 Panda
>
> No new scary things seen on boot. Can someone check this on AM3, too?

I gave this a basic boot test on am335x-boneblack.  All is well.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

