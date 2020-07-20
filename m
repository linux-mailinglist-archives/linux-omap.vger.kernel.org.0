Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3663C2261CA
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 16:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgGTOT0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 10:19:26 -0400
Received: from mout.web.de ([212.227.15.3]:36291 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726782AbgGTOT0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Jul 2020 10:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595254748;
        bh=OExZunafEjPoP/mn9AZfuMf11tWR5wYwJKvm6Ui+qd8=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=nCsQwJeXM3JTRNYoaAgymHldDMNxKi9xNxlf0c68SWP6/7G7Pnu6ENy0vqEydLohv
         U43dpQR2UEm2etr3HyMzpsrEcGNV1wb4nipviOOC5jkU/SAJbysk6+cWj5b4OSkJZi
         JGOAHXYTv6ZjdDgPDDCGIPl61Q5lSDUwX8vwnjxk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.85.87]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MbyJ4-1kEdVi0W3C-00JGTj; Mon, 20
 Jul 2020 16:19:08 +0200
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] clk: ti: clkctrl: add the missed kfree() for
 _ti_omap4_clkctrl_setup()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Jing Xiangfeng <jingxiangfeng@huawei.com>,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Message-ID: <ddf4efea-0a4b-de0a-e0cd-bdc04f5859d6@web.de>
Date:   Mon, 20 Jul 2020 16:19:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H4VJpDEaIHRf6gXge9wZRkoVyHFbgCXbOtheUaUJxJOnEaWmmQq
 l4FyCXqCpk/Sf0HrUobIiCacbtrQbmg+AV6as9pzez1TA7oSxzWrhn4JPc6By1Vrc1ttig8
 crOZM+nhe4snQs1a8VIdv6nCSRIx5KvF3wa/claaEj3Kwa6L7VBI4zVTgxYVsQFtb8OF8eT
 IWvWPZuTO2i1xY4pRJYJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:czClYcnBbjc=:i8f68ub+ju+uVxKRcUaR5A
 FMkDquBSkC1GscPwxGLiqTM93QVpzxP/h5LJAFankxYZ9jGJojzXe8H6+xO0pTE+pqvjtx+kD
 kBXSe+dJ6ltRXb9nD5qYGN3aUf4++DC/smsPlDZrO8xAL4C+wGIakLXKzdxKaXrDb+roxGD8q
 7Ln86edGwMywnH+AtbzQoQD7ZYlSgMa2Zf61B7lSk8gZNRSxt5wxHA6RWyZL0dNXalqme+/oh
 DbSmuvAfXKuO2fpddBZCx7+IQGvAD24E6r8DtVpOKrV+4/uApBW3PRtDCrVHiZYOwUvSpnJ+p
 s3qqS18WrCIL6XjijzxiwcE4HOWpHdHhwnTXjNgIsAkLDotmjkUt0Ge2e1c+nwj73EDjyG4jZ
 7h1RC6iAkgXrAhmD6Fn7gEoGU3VZWLG4MYFh7g2M7grYeSbE3zJ8HykrJqGtqTDRnrCAxYcCI
 pLWTZ6HzTCPrdAl1Lnf5ZJqlNEU9KmbJd03/yWc9Vxql9NIVT3JRsM54Lh0OorLG2odZxIHQK
 nDEkJhTGob26E6l2c18+UOpAGJi5cWAq1iUqSWySSJBKiU/Z4D9BALtFufPiXC+c7OK3U3JLy
 p1e4ZllFwnHK3hRaED3vuA7Rl+n3CIfJP/eYVPs2L0yKuTI+1GmdxQC01x+tbSlwYGd9Sas34
 CbTDm68hTfjb9peI8QmaIYKGLTCIvRUB1u0cEnNLe8pjIGDe7KYBGeqWTWWH8v61hBaFXVXQa
 zdjNF6gjUtt8szcGf/tb5AXNGp1bdAo4GaQ1wmuJxFaLyYZgiwMnk45zxfWChBv9tr7P3uZrX
 /oNXUvNu+bFARUnqA6/pUHVrkjVm9mvfChkscFsMhagmqjQ7+srI34uOrIuLOQGSLRBEy/4cG
 2Kl67QpQxIdnng+hbG/6lv7LP64sRyxoVZgJ0YH9w90EHIlYOvKbs8uhXFgwAQqzAkQPq4oFV
 +IlHPg18NWmbROsa3JenDFhrVpVHIf2Z7bLqlW5bS5yeHCNhUmXk7Zee4BzW3ASRKTe2VV8x+
 94xrz4N/nPL1LS10DXEhnwyuoROrzEqMu3Rj8b+Q96/6lZprNijUijatBYndXFzfLxR8RzCWc
 0U60Tv//ZED+OgdOu3N9J8GuLKxGlK9whmJNSLUKEpj/fznxRBDLGxSgBuBV+BgzIWoZF/ViL
 rWNaYsyZwvkmcjPi9HojifWf1Z9kZwpKMDpgzK6t4NqdRc6ZCsy78T8o5VDKEGv8VxcYPK4Z1
 8LIw2SXFzxyIZg7DL0CkJB17FcZtwXw07geVo7A==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

=E2=80=A6
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -655,8 +655,10 @@ static void __init _ti_omap4_clkctrl_setup(struct d=
evice_node *node)
>  		}
>
>  		hw =3D kzalloc(sizeof(*hw), GFP_KERNEL);
> -		if (!hw)
> +		if (!hw) {
> +			kfree(clkctrl_name);
>  			return;
> +		}
=E2=80=A6

I suggest to use an additional label instead.

 		if (!hw)
-			return;
+			goto free_control_name;


By the way:
How do you think about to replace the label =E2=80=9Ccleanup=E2=80=9D by o=
ther jump targets
for better exception handling in this function implementation?

Regards,
Markus
