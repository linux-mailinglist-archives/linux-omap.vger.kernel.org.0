Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C262261CD
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgGTOTZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 10:19:25 -0400
Received: from mout.web.de ([212.227.15.3]:40427 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726759AbgGTOTZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Jul 2020 10:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1595254748;
        bh=OExZunafEjPoP/mn9AZfuMf11tWR5wYwJKvm6Ui+qd8=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=nCsQwJeXM3JTRNYoaAgymHldDMNxKi9xNxlf0c68SWP6/7G7Pnu6ENy0vqEydLohv
         U43dpQR2UEm2etr3HyMzpsrEcGNV1wb4nipviOOC5jkU/SAJbysk6+cWj5b4OSkJZi
         JGOAHXYTv6ZjdDgPDDCGIPl61Q5lSDUwX8vwnjxk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.85.87]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MIvJx-1jzSRG3BjF-002V31; Mon, 20
 Jul 2020 16:19:07 +0200
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
Message-ID: <b7f0dcda-7ec8-b3d8-ba53-c2720799abbc@web.de>
Date:   Mon, 20 Jul 2020 16:19:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TAFFwBtUf8EMNr/i/7TMnPeNyQcFIJxVsJk/5fTyr7p1J1qk018
 fz/JckmV8XsByZXh2Zj75KND5waumCuZnw6jtU5rFTvLQN305qpUALa0mZFiCI4eOb/EoNl
 DD+ouzsHWjJafnwI8H6dMcimm99iCpUu7J9SuisZlNLwVChk1vrA8PJbwbu253X5n4w4A+g
 0r3EuC1S7GhGTFcVTOTEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xDb4Kd9oyQU=:O6vWZA1wfG47BY4IITt4xR
 ouJ93vgB9vJl/s6q5eRIy+s3rO2Y/LW1edBHxAw/BgO+cA0dnCL93L6P2USpZeKYmVClhn/+E
 s/sCnAjR97qxU6tLNc3Ai/sARit1uRBnESuWETBHaXJ4DlpsSmFMXXcBurA1GAwvx7odSDp8Y
 yfmNb/FFuzZjgwQMVAv3/QHaq+t9Ze3kCRUdtpP/vHYYrww8ylxR5hDE7JKHwEqqRfiXQ1d1J
 u6DheFOZOcrYVZF0Ko0qtushemPGdlA5SAEMCgPVYIe3O2id74ou3hZMbFbpeCZGD5QLajHgk
 l0itQfnflsQ6PfItn0cIHfEceSYDGsOzJWhbaNyWN+QjSiQlBKvnSzXWrOxDWroYfYplOBbeI
 D/AcmSFs3w8G6LAC45rJsu9Or122MWXMl26nfgK7JuPfTiDcLy6uzsfyUeymTUG7vS6E6H9mj
 kceOcGamm+XLEd58xEMw9yyphAYq9sh0TqCaxCQqHqrJvEtvQ0dYwADzKujkB88LrOmZ3eIr1
 15ji6JzkZughAWxsw9dCKJZYPK9yW1+PyU1cfZaAaQU6/3Ov5YJ08bb85kwOb9/HDDx54Ksy4
 VZpjmDVvhpefb/xOFvuJtSDR2jBcmdIbAA6zrd2YMo0DdeJQ3tzCmVSzexg5J86HrRaGhqpyt
 H7FafP7tL+pkp0+FksldQpbx9SCtAXHkZxa0KwJAMly1Z1qT9U9g7dTQWyhDfHgxxFDmZFONp
 B+WTjQEZivGPqq2DeGRztx1XyZZB/dw6p+iMA3715sWYHJrwqRWnE9D6VhecwgxCW1kCV+8ID
 AViv2PGZ50DvOAU30RKKPZprcKJhBVmPPyGFxmWfQc+++HHRQG3rwTtZDMCdfVLp3Lw+OaD43
 +oGuVK++r1dabqp2jLXhn6pHuakrz0kYX7V4qnYfteGDCNWF7DambndKLXi6mXk17HKD1dWbB
 q250ICIuHJDOd+B399zAqav0L0SyTxqDTVCUEd93lDOdPj0bH3Hhcd/z00hSSdaWPJ4fFeojn
 q5CrczNWwXok2bAiRfmO3EPOeAIgwktjFG/pL9x1cjo2wwEC/FNsAJVj27jO+kfN80lMapdhZ
 Amu0dS4VJd2Xeb7jLsCJI1iu46PjwmwfdcoNivQCerS9TqzKb/iRkwsrqPZllqToRVpA+SnIO
 utHjIzwYQQ85xwSHgoIPNaL/Cg680wA6JlBgAOPcWqSO+D4H/lAviYIAmrsqXUo642RdjUNt5
 tMdAb2R7il3tnIi8A1WeYGjsBqVI3qV3dGwjQww==
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
