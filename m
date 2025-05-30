Return-Path: <linux-omap+bounces-3749-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C9AC874A
	for <lists+linux-omap@lfdr.de>; Fri, 30 May 2025 06:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080473BC029
	for <lists+linux-omap@lfdr.de>; Fri, 30 May 2025 04:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB591DDA1E;
	Fri, 30 May 2025 04:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhmqoDxL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B94430;
	Fri, 30 May 2025 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748579220; cv=none; b=oRfSONQTozh08U/o8osUWK0jM6auJs9BpEsjNV3sP1WxZ7vnxV+3WaX0rrizvRRzNprZBRUmomA3kJeTkhoGL08geyqPclFJRZm8PzFWWJM/sMCUXDmAO6PtTlef2wu8iHEJxach5niuNvPl4/7QlVRE4pQC/eETW39Bn2Ovq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748579220; c=relaxed/simple;
	bh=i78PUUdi5zUCTmaJv+tqoMT3SKJTsfKFV2V4vz0UtUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p5wLgS7qxDOfe3IcOhnX7in5awrFL2nE586Bu2KvsHQv1qC5clLmgKhZ3BkSRgEqe4Devf5vd8UtrrkRIhv3gITk7GrA5aZuZTTIRV3dmo9u32ovEnGmhRhG6gPB3UgrPkmByGaRaneKG7D1XAa3QWiQgDxo1Z8DncAftAO2ISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhmqoDxL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553241d30b3so1846965e87.3;
        Thu, 29 May 2025 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748579217; x=1749184017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cUfFUBNSEriDxRb2IzxC9/n0RXxLFJKdbbL6QYJivA=;
        b=NhmqoDxLZzMxa5Wjska6QnEqgQgUOWnvjSBACEgY8Q3xG7CfGRiwzTqp50j88wXil+
         rRNl49U+DgoCl6hOljT3gf2VcjF3KHD7ueVwkDbUl7JcBNh1Mbr7VyCCL5gZs2r1IjAw
         FPHv6qJ0KX1bn9FLh26mm4oCBeXLwLR3dP3LGF9TQT9/AIlC4ZcqL8Dr1lyDZaYnSBxy
         Bv0eX6wkzZ0IvWIOnUjdka9yY8IqxqTxttZrBFtankLHzxcKw+ydYsgabXZ0K+UaOl2h
         6HcwI3FgVRriMDqf0sLtPv+5A6XxGonn5kNJFCPx2Ku9TB5idiRV9EdfwEkxPdEzu4+y
         eV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748579217; x=1749184017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cUfFUBNSEriDxRb2IzxC9/n0RXxLFJKdbbL6QYJivA=;
        b=F0Z0Rus9RJmY2Pz4/wvc2jLQdmi7Boi4MmXioDJ0bcXH4+ypa65WBnTO3phC69Pdlo
         bN1r4vWzGyrwxLu5cK+p3sCSEcYtC7Bljt8az+ub+i6WRGd4z66NaqjopsmwrS0ZZpQi
         +ON/A9NAWLceDOnr+3sJdCouFK4bH1kM9cMjq8+kHBHQ27mmbdB+hkqtBcFlx9RjxCZQ
         4Si8HEPj9cOugVpG26qpPxacXu2l6Bw4s9CDCH1nKAEYIksumnxQBk63Yi3ELwRSgywW
         k9ZMXaEmoA1bpEHZCViJeXVyS+A1vToQNbemcuwDvXBG1nLVSS9SmuqzMMtFwu0OFY5H
         s3tg==
X-Forwarded-Encrypted: i=1; AJvYcCVvFuTVCcUUqkYcu1MQi7p9yMLaE7U5hGIgwdqaO3yWlUag5DCiELaFVG8T2tg2R6BBxrSbDT+dG8zPAA==@vger.kernel.org, AJvYcCXoht1TdYDJdaIPEMF3bRnfYEA1GVhRvu+Gz6CqKO/TyrfUX4SKe6UMwjGoiXtS0o6pKRQX7Ad2rohYOv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHVYdpq4qkXRib/G/CBPnfDiYeSaSiaAMwJ/SFk10G2O4qTbDz
	bE1hDaziv6+SSJBRYdLd9eG3ZV6Pi6RVZ4SrYLcME4BR+UmDE7d+CSu2
X-Gm-Gg: ASbGncvMNxvB62nvBzaduLAxOJuLjUqwu/V99pLBkpnzhLLRSkxJkCB/QhIknc0ZrGq
	pj6mEvCLoSVl7SSwFbEAq5hofyOCuTSqn6lM4izebIGxW0nk9um7cycW9f3KkrAeMK42w6IXFwJ
	bZUlElnVTroYINOa8ar9pQKK1xb37MHYUUgDUFNr6rbrvAO69CFxvXaXEWeIfiiIvvDxIxomLfX
	kU10Wi0EwV28pBauV3YzY5NGA9usuiWXYZb2VSvJo3v0fFKu+ZJme52UZdm60uKxnbEDuGMqpoI
	ZR4RdYfHQkBnU/LWwx8qwrZDkE1kXb+3Mt0RysD6HpBKh9RwDCoSkfpm4LX+WwK9yY4ONqefIq/
	Oz9sax8RvKCtmqNpbXFNb2Aayl2t4BFrn2vT3y5F5P4g=
X-Google-Smtp-Source: AGHT+IGuXhOrU45WLtPXz+vrV5WSbqfhZy6p6bxNlYIqNzI1Gym7QVkgZ5+4VSaTxBaa/rgvx8QCKg==
X-Received: by 2002:a05:6512:1595:b0:553:2969:1d61 with SMTP id 2adb3069b0e04-5533b90a316mr671673e87.24.1748579216437;
        Thu, 29 May 2025 21:26:56 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533789d769sm561918e87.56.2025.05.29.21.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 21:26:55 -0700 (PDT)
Message-ID: <8ef8257b-da1d-4436-91f1-72721a45bc5d@gmail.com>
Date: Fri, 30 May 2025 07:26:54 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: Constify reg_sequence and regmap_irq
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 Lee Jones <lee@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Krzysztof!

On 28/05/2025 22:44, Krzysztof Kozlowski wrote:
> Static 'struct reg_sequence' array, 'struct regmap_irq_sub_irq_map' and
> 'struct regmap_irq_chip ' are not modified so can be changed to const
> for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

