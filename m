Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C88949B1A9
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jan 2022 11:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348612AbiAYKZR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jan 2022 05:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60225 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348647AbiAYKXL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Jan 2022 05:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643106179;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KfO8JQDP2fzwwyVNOov4juy70MimJyiWRONtd3Q4kcc=;
        b=Lvnqp8YyUk2T92ddnKXC4h8IrbPaxq9kbD71I7A0HFnXK9EAEZlbhCUFeL5Jwtaznw7UmA
        EoZxQy3jkp3FUqQ4/vw1ISv4atLSTswroNXw9kIB+mlRdGa0IgQAYKNYe8g7NvS69KND7V
        GxLgifleW4FkeajOxp26nAELeKcnqC0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-kQScg8NOMnWgZCBm9pAUpA-1; Tue, 25 Jan 2022 05:22:58 -0500
X-MC-Unique: kQScg8NOMnWgZCBm9pAUpA-1
Received: by mail-ej1-f71.google.com with SMTP id rl11-20020a170907216b00b006b73a611c1aso2633012ejb.22
        for <linux-omap@vger.kernel.org>; Tue, 25 Jan 2022 02:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=KfO8JQDP2fzwwyVNOov4juy70MimJyiWRONtd3Q4kcc=;
        b=M+eVw6Ec61ofToFl3f2BQTnt5WeXLfFDq2pyk3ubc6TQPwkRV6Z2UPpJeOvQawQo7a
         KG4lsYAwawp7lHpiCgXBpB9P8h35a/09vFwcE7k9K44z6Ino6/efw/lWMi/q5piOo7Tl
         XAGzrpZwKWY2y9w0np6wwQVC7E9X1/BoiL2O6mbYw7iemwgmAIJMZi9xJMzjtlKcvR16
         KNRgSsFUl19np2eOakCkcPgQWKcShsJJyGBRnAipFdY2PKKdIkOGH9WZpj8cNj2xZQ4o
         t9y5BN2lUoPl0fd1RpiRn+sKeT/BGMTgbmdsATRjpUyisLiIXSWTK71Kqr0CtXnzTFgG
         VWsg==
X-Gm-Message-State: AOAM53360zKNZT8f1nq+78FgSYth3zMwQXFxV4WTqaureweuu67L5DsC
        1nSyWg+BjMp++sQBfoKxvj8ZFAetGW3c/EUSC9xh+O/alY/NH7X8uivz3TDAJ67xI6BQ0X+SVTN
        PX337CDXCAcHMnrRkLrNIdQ==
X-Received: by 2002:a05:6402:5246:: with SMTP id t6mr12304172edd.35.1643106176133;
        Tue, 25 Jan 2022 02:22:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfHmpaq8eF4mbc3w+L8OSpYsJBEPi/S6sbiyN/cLWAZjc9Fv5atMbCeIp8pJB+8gJ57Rvq6w==
X-Received: by 2002:a05:6402:5246:: with SMTP id t6mr12304117edd.35.1643106175159;
        Tue, 25 Jan 2022 02:22:55 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id g12sm8033268edv.89.2022.01.25.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 02:22:54 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id E35D01805FA; Tue, 25 Jan 2022 11:22:52 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Murali Karicheri <m-karicheri2@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net] net: cpsw: Properly initialise struct page_pool_params
In-Reply-To: <20220125051522.GA1171881@euler>
References: <20220124143531.361005-1-toke@redhat.com>
 <20220125051522.GA1171881@euler>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 25 Jan 2022 11:22:52 +0100
Message-ID: <87tuds3yir.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Colin Foster <colin.foster@in-advantage.com> writes:

> On Mon, Jan 24, 2022 at 03:35:29PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> The cpsw driver didn't properly initialise the struct page_pool_params
>> before calling page_pool_create(), which leads to crashes after the stru=
ct
>> has been expanded with new parameters.
>>=20
>> The second Fixes tag below is where the buggy code was introduced, but
>> because the code was moved around this patch will only apply on top of t=
he
>> commit in the first Fixes tag.
>>=20
>> Fixes: c5013ac1dd0e ("net: ethernet: ti: cpsw: move set of common functi=
ons in cpsw_priv")
>> Fixes: 9ed4050c0d75 ("net: ethernet: ti: cpsw: add XDP support")
>> Reported-by: Colin Foster <colin.foster@in-advantage.com>
>> Signed-off-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
>> ---
>>  drivers/net/ethernet/ti/cpsw_priv.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/=
ti/cpsw_priv.c
>> index ba220593e6db..8f6817f346ba 100644
>> --- a/drivers/net/ethernet/ti/cpsw_priv.c
>> +++ b/drivers/net/ethernet/ti/cpsw_priv.c
>> @@ -1146,7 +1146,7 @@ int cpsw_fill_rx_channels(struct cpsw_priv *priv)
>>  static struct page_pool *cpsw_create_page_pool(struct cpsw_common *cpsw,
>>  					       int size)
>>  {
>> -	struct page_pool_params pp_params;
>> +	struct page_pool_params pp_params =3D {};
>>  	struct page_pool *pool;
>>=20=20
>>  	pp_params.order =3D 0;
>> --=20
>> 2.34.1
>>=20
>
> Works for me. Thanks Toke! Hopefully my tested by tag addition is done
> correctly:
>
> Tested-by: Colin Foster <colin.foster@in-advantage.com>

You're welcome! Tag looks good, thanks for testing :)

-Toke

