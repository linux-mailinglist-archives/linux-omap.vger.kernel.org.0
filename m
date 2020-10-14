Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D47128E37E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387445AbgJNPpx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731627AbgJNPpw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:45:52 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7319AC0613D2
        for <linux-omap@vger.kernel.org>; Wed, 14 Oct 2020 08:45:52 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id n6so5646863ioc.12
        for <linux-omap@vger.kernel.org>; Wed, 14 Oct 2020 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GVsFzR74egr+o93/X35XS2maZ1vLsmxHPBrJlJDsuhI=;
        b=X4aAHpmKSHgU3/84qpUaV903w1xkwCtvsv7XMV8dUuc9QnpjmB/jKfLFcdpqh7UmY4
         IG9lWFz+HRgkE8tRa/pOXAXobj0l94fXgiNfyoap+V7yrzg1LQqQgDVrbGZk1Qt7MpXw
         IsWNMw7UDTAPcoV7udFaMBNkFCpbRweWEvQFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GVsFzR74egr+o93/X35XS2maZ1vLsmxHPBrJlJDsuhI=;
        b=V8Agjxq80m3RtFtvb7gnDp79K67IPpBoFvgLy2HM/zwxtAqZ/u9rHxuNuCizPoE/6v
         t90N67+Z6qimbbc3ZpMjcYStUTpjXsd6IX1cypELaAovBEXlOuuD8Kt/zmrzAnz8WzEH
         K29GDYzK/AablzRfEtElRU6lEFoHZD1T8HkS3DcSpRtYdCb3N8zgS36DsI+r1baV79iB
         e52mgKchpRyQS9gDC0k9Hm4jrEa7watFDsc5+aI6QLW1cJt84nCfdJUF7ASZTUcz3ytw
         9+P1LEGvXjBhaanOjiY6Al8fiWPqn5B4M7s+aU2sLEO8upmYnH3YPxApaq6wDLA5XoCs
         yW3A==
X-Gm-Message-State: AOAM53203rYcZAcQja3NdHyBukuP+6j8WGDp36shMyjFt3xicjCV/z78
        cr2OTHGyNOkqdtMYLzr7oobrPw==
X-Google-Smtp-Source: ABdhPJxFL0dEO8+kC0xlhiweNLkyf1APFnjIPT9B9l6CjUgbzU9W6XQstgVJjfauCC4EZCo/jPEspg==
X-Received: by 2002:a02:a510:: with SMTP id e16mr43790jam.51.1602690351653;
        Wed, 14 Oct 2020 08:45:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t22sm3922965ili.9.2020.10.14.08.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 08:45:50 -0700 (PDT)
Subject: Re: [patch 07/12] usbip: Remove in_interrupt() check
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.828083323@linutronix.de>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fa656cc7-a323-7013-8435-915a1f8b5866@linuxfoundation.org>
Date:   Wed, 14 Oct 2020 09:45:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014145727.828083323@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/14/20 8:52 AM, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out and Linus clearly
> requested that code which changes behaviour depending on context should
> either be separated or the context be conveyed in an argument passed by the
> caller, which usually knows the context.
> 
> usbip_recv() uses in_interrupt() to conditionally print context information
> for debugging messages. The value is zero as the function is only called
> from various *_rx_loop() kthread functions. Remove it.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---
>   drivers/usb/usbip/usbip_common.c |    5 -----
>   1 file changed, 5 deletions(-)
> 
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -324,11 +324,6 @@ int usbip_recv(struct socket *sock, void
>   	} while (msg_data_left(&msg));
>   
>   	if (usbip_dbg_flag_xmit) {
> -		if (!in_interrupt())
> -			pr_debug("%-10s:", current->comm);
> -		else
> -			pr_debug("interrupt  :");
> -
>   		pr_debug("receiving....\n");
>   		usbip_dump_buffer(buf, size);
>   		pr_debug("received, osize %d ret %d size %zd total %d\n",
> 
> 

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

